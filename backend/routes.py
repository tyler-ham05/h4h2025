from app import app, db
from flask import request, jsonify
from models import Group, Hobby
import json

#list all groups
@app.route("/api/groups", methods=["GET"])
def get_groups():
    groups = Group.query.all()
    result = [group.to_flutter() for group in groups]
    return jsonify(result) # -- By default group data is sent as a JSON file, however you can convert it easily within flutter (https://docs.flutter.dev/data-and-backend/serialization/json)
# Ceate a Group
@app.route("/api/groups",methods=["POST"])
def create_group():
    try:
        data = request.json
        group_name = data.get('group_name')
        description = data.get('description')
        location = data.get('location')
        new_group = Group(group_name=group_name, description=description,location=location)

        db.session.add(new_group) #this is a lot like git, we adding the new group in creation to the staging area
        db.session.commit()

        return jsonify({"msg":"group created"}),201
    except Exception as e:
        db.session.rollback()
        return jsonify({"error":str(e)}), 500
#kill group
@app.route("/api/groups/<int:id>", methods=["DELETE"]) #we must specify which mf we want to kill, so we do that here
def kill_group(id):
    try:
        grouper = Group.query.get(id)
        if grouper is None:
            return jsonify({"error":"mf is not here"}), 404
        else:
            db.session.delete(grouper)
            db.session.commit()
            return jsonify({"msg":"i shot the mf in cold blood"}),200

    except Exception as e:
        db.session.rollback()
        return jsonify({"error":str(e)}), 500
#update mf
@app.route("/api/groups/<int:id>", methods=["PATCH"]) #we must specify which mf we want to fix, so we do that here
def update_group(id):
    try:
        grouper = Group.query.get(id)
        if grouper is None:
            return jsonify({"error":"mf is on the run (index not found)"}), 404
        else:
            data = request.json
            grouper.group_name = data.get("group_name",grouper.group_name)
            grouper.description = data.get("description",grouper.description)
            grouper.location = data.get("location",grouper.location)
            db.session.commit()
            return jsonify({"msg":"i fixed bro dw (updated data)"}),200
    except Exception as e:
        db.session.rollback()
        return jsonify({"error":str(e)}), 500
    
@app.route("/api/hobbies", methods=["GET"])
def get_hobbies():
    hobbies = Hobby.query.all()
    result = [hobby.to_flutter() for hobby in hobbies]
    return jsonify(result)
    
@app.route("/api/hobbies/<string:tag>", methods=["GET"])
def get_hobbies_by_tag(tag):
    try:
        hobbies = Hobby.query.all()
        result = []
        for hobby in hobbies:
            if hobby.tags:
                tags_list = [t.strip() for t in hobby.tags.split(",")]
                if tag in tags_list:  # Check if the tag is in the list
                    result.append(hobby.to_flutter())
        if not result:
            return jsonify({"error": "No hobbies found with the specified tag"}), 404
        return jsonify(result), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
@app.route("/api/hobbies",methods=["POST"])
def create_hobby():
    try:
        data = request.json
        hobby_name = data.get('hobby_name')
        description = data.get('description')
        to_start = data.get('to_start')
        locations = data.get('locations')
        starting_cost = data.get('starting_cost')
        tags = data.get('tags')
        img_url = data.get('img_url')
        new_hobby = Hobby(hobby_name=hobby_name, description=description,to_start=to_start,locations=locations,starting_cost=starting_cost,tags=tags,img_url=img_url)
        db.session.add(new_hobby) #this is a lot like git, we adding the new group in creation to the staging area
        db.session.commit()
        return jsonify({"msg":"hobby created"}),201
    except Exception as e:
        db.session.rollback()
        return jsonify({"error":str(e)}), 500