from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

#allowsflask to do things more efficently 
app = Flask(__name__)
CORS(app)

#creates goated sqlite database locally in the backend folder
app.config['SQLALchemy_DATABASE_URI'] = "sqlite:///groups.db"

#flags track mod false for more efficent use
app.config["SQLALchemy_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)

#Ensures that the file only runs in debug mode if ran primarily (not through another python file)
if __name__ == "__main__":
    app.run(debug=True)


