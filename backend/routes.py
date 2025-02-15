from app import app, db
from flask import request, jsonify
from models import Group

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

    
