from app import db

#in group creation, various fields are filled to create a group
class Group(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    group_name = db.Column(db.String(100), nullable = False)
    description = db.Column(db.Text, nullable = False)
    location = db.Column(db.String(100), nullable = False)
    img_url = db.Column(db.String(200), nullable = True)

#to flutter is what i will use to send field values to flutter
    def to_flutter(self):
        return {
            "id":self.id,
            "group_name":self.group_name,
            "description":self.description,
            "location":self.location,
            "img_url":self.img_url,
        }
    


