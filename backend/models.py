from app import db

#in group creation, various fields are filled to create a group
class Group(db.Model):
    __bind_key__ = None
    id = db.Column(db.Integer, primary_key=True)
    group_name = db.Column(db.String(100), nullable = False)
    description = db.Column(db.Text, nullable = False)
    location = db.Column(db.String(100), nullable = False)

#to flutter is what i will use to send field values to flutter
    def to_flutter(self):
        return {
            "id":self.id,
            "group_name":self.group_name,
            "description":self.description,
            "location":self.location,
        }
class Hobby(db.Model):
    __bind_key__ = "hobbies"
    id = db.Column(db.Integer, primary_key=True)
    hobby_name = db.Column(db.String(100), nullable = False)
    description = db.Column(db.Text, nullable = False)
    to_start = db.Column(db.Text, nullable = False)
    locations = db.Column(db.Text, nullable = False)
    starting_cost = db.Column(db.String(10), nullable = False)
    tags = db.Column(db.String, nullable=False)
    img_url = db.Column(db.String(200), nullable=False)

    def to_flutter(self):
        return {
            "id":self.id,
            "hobby_name":self.hobby_name,
            "description":self.description,
            "to_start":self.to_start,
            "locations":self.locations,
            "starting_cost":self.starting_cost,
            "tags":self.tags,
            "img_url":self.img_url
        }




