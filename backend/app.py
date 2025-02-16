from flask import Flask, jsonify, request 
import json
from flask_cors import CORS


app = Flask(__name__) 
CORS(app)
with open("data/groups.json", "r") as file:
    data_group = json.load(file)
with open("data/hobbies.json", "r") as file:
    data_hobbies = json.load(file)
tags = []
for hobby in data_hobbies:
    tags.extend(hobby["Tags"])
hob_tags = list(set(tags))

@app.route('/', methods = ['GET', 'POST']) 
def home(): 
    if(request.method == 'GET'): 
  
        data = "hello world"
        return jsonify({'data': data}) 
    
@app.route('/groups', methods = ['GET']) 
def group(): 
    return jsonify(data_group) 

@app.route('/hobbies', methods = ['GET']) 
def hobbies(): 
    return jsonify(data_hobbies) 
  
@app.route('/tags', methods = ['GET']) 
def tags(): 
    return jsonify(hob_tags) 

if __name__ == '__main__': 
    app.run(debug = True) 