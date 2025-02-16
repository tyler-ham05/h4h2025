from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

#allowsflask to do things more efficently 
app = Flask(__name__)
CORS(app)

#creates goated sqlite database locally in the backend folder
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///groups.db"

#flags track mod false for more efficent use
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

app.config['SQLALCHEMY_BINDS'] = {
    'hobbies': 'sqlite:///hobbies.db'}


db = SQLAlchemy(app)

with app.app_context():
    db.create_all()
    db.create_all(bind_key='hobbies')

import routes

#Ensures that the file only runs in debug mode if ran primarily (not through another python file)
if __name__ == "__main__":
    app.run(debug=True)


