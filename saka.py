from fastapi import FastAPI,Depends,HTTPException
import pyodbc 
from pydantic import BaseModel
connection=(    r'DRIVER={SQL Server};'
    r'SERVER=DESKTOP-9I1IMC6;'
    r'DATABASE=sakan;'
    r'Trusted_Connection=yes;')

try:
    conn=pyodbc.connect(connection)
    print("Connected to SQL Server database successfully!")
except pyodbc.Error as ex:
    print("Error connecting to database:", ex)
class Owner(BaseModel):
    # owner_id: int
    Name: str
    E_mail: str
    password: str
    username: str
    image: str

class OwnerAddress(BaseModel):
    address: str
    owner_id: int

class OwnerContact(BaseModel):
    contact: str
    owner_id: int

class Property(BaseModel):
    # app_id: int
    price: int
    name: str
    size: int
    status: str
    description: str
    owner_id: int

class PropertyAddress(BaseModel):
    address: str
    app_id: int

class PropertyImage(BaseModel):
    # img_id: int
    description: str
    app_id: int

class Admin(BaseModel):
    # admin_id: int
    name: str
    password: str
    username: str


class AdminContact(BaseModel):
    contact: str
    admin_id: int

class Customer(BaseModel):
    # cust_id: int
    Name: str
    E_mail: str
    password: str
    username: str
    image: str

# class CustomerAddress(BaseModel):
#     address: str
#     cust_id: int

class CustomerContact(BaseModel):
    contact: str
    cust_id: int

class Room(BaseModel):
    # room_id: int
    size: int
    room_type: str
    price: int
    app_id: int

class Notification(BaseModel):
    # notification_id: int
    Name: str
    description: str
    admin_id: int

class Comment(BaseModel):
    # comment_id: int
    comment: str
    comment_date: str
    comment_time: str
    app_id: int
    admin_id: int
    cust_id: int

class Appointment(BaseModel):
    # appointment_id: int
    date: str
    time: str
    status: str
    owner_id: int
    admin_id: int
    cust_id: int



app = FastAPI()
@app.get("/")
def read_root():
    return {"message": "Welcome to your FastAPI application!"}
@app.get("/owners/{owner_id}",response_model=Owner)
def get_owner(owner_id:int):
    cursor=conn.cursor()
    
    cursor.execute(" SELECT * FROM owner WHERE owner_id = ?",owner_id)
    row =cursor.fetchone()
    cursor.close
    if row:
        return dict(zip(['owner_id', 'Name', 'E_mail', 'password', 'username', 'image'],row))
    else:
        raise HTTPException(status_code=404,detail='Owner not found')
@app.post('/owners/',response_model=Owner)
def create_owner(owner:Owner):
    cursor=conn.cursor()
    cursor.execute("INSERT INTO owner(Name, E_mail, password, username, image)VALUES(?,?,?,?,?)",
                   owner.Name,owner.E_mail,owner.password,owner.username,owner.image)
    conn.commit()
    cursor.close()
    return owner
@app.put('/owners/{owner_id}',response_model=Owner)
def update_owner(owner_id:int,owner:Owner):
    cursor=conn.cursor()
    cursor.execute(
        "UPDATE owner SET Name=?,E_mail=?,password=?,username=?,image=? WHERE owner_id=?",
        owner.Name,owner.E_mail,owner.password,owner.username,owner.image,owner_id
    )
    conn.commit()
    cursor.close()
    return owner
@app.delete('/owners/{owner_id}')
def delete_owner(owner_id:int):
    cursor=conn.cursor()
    cursor.execute(
        "DELETE FROM owner WHERE owner_id=?",owner_id
    )
    conn.commit()
    cursor.close()
    return {'message':'Owner has been deleted'}
######################################################

@app.get("/owner_addresses/{owner_id}", response_model=OwnerAddress)
def get_owner_address(owner_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM owner_address WHERE owner_id = ?", owner_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['address', 'owner_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Owner address not found")
@app.post('/owner_address/',response_model=OwnerAddress)
def create_owner_address(owneraddress:OwnerAddress):
    cursor=conn.cursor()
    cursor.execute("INSERT INTO owner_address(address,owner_id) VALUES(?,?)",
                   owneraddress.address,owneraddress.owner_id)
    conn.commit()
    cursor.close()
    return owneraddress
@app.put('/owner_addresses/{owner_id}',response_model=OwnerAddress)
def update_owner_address(owner_id:int,owner_address:OwnerAddress):
    cursor=conn.cursor()
    cursor.execute(
        "UPDATE owner_address SET address=? WHERE owner_id=?",
        owner_address.address,owner_id
    )
    conn.commit()
    cursor.close()
    return owner_address
@app.delete('/owner_addresses/{address}')
def delete_owner_address(address:str):
    cursor=conn.cursor()
    cursor.execute(
        "DELETE FROM owner_address WHERE address=?",address
    )
    conn.commit()
    cursor.close()
    return {'message':'Owner address has been deleted'}
#########################################################
# 
@app.get("/owner_contacts/{owner_id}", response_model=OwnerContact)
def get_owner_contact(owner_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM owner_contact WHERE owner_id = ?", owner_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['contact', 'owner_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Owner contact not found")

#
@app.post("/owner_contacts/", response_model=OwnerContact)
def create_owner_contact(owner_contact: OwnerContact):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO owner_contact (contact, owner_id) VALUES (?, ?)",
        owner_contact.contact, owner_contact.owner_id
    )
    conn.commit()
    cursor.close()
    return owner_contact

# 
@app.put("/owner_contacts/{owner_id}", response_model=OwnerContact)
def update_owner_contact(owner_id: int, owner_contact: OwnerContact):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE owner_contact SET contact=? WHERE owner_id=?",
        owner_contact.contact,owner_id 
    )
    conn.commit()
    cursor.close()
    return owner_contact

#
@app.delete("/owner_contacts/{contact}")
def delete_owner_contact(contact: str):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM owner_contact WHERE contact=?", contact)
    conn.commit()
    cursor.close()
    return {"message": "Owner contact deleted successfully"}
##########################################################################
#ADMIN
@app.get("/admins/{admin_id}", response_model=Admin)
def get_admin(admin_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM admin WHERE admin_id = ?", admin_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['admin_id', 'name', 'password', 'username'], row))
    else:
        raise HTTPException(status_code=404, detail="Admin not found")

#
@app.post("/admins/", response_model=Admin)
def create_admin(admin: Admin):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO admin (Name,password,username) VALUES (?,?,?)",
    Admin.name,Admin.password,Admin.username
    )
    conn.commit()
    cursor.close()
    return admin

# 
@app.put("/admins/{admin_id}", response_model=Admin)
def update_admin(admin_id: int, admin: Admin):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE admin SET Name=?,password=?,username=? WHERE admin_id=?",
        admin.name,admin.password,admin.username,admin_id
    )
    conn.commit()
    cursor.close()
    return admin

#
@app.delete("/admins/{admin_id}")
def delete_admin(admin_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM admin WHERE admin_id=?", admin_id)
    conn.commit()
    cursor.close()
    return {"message": "Admin deleted successfully"}
#################################################################
# @app.get("/Admins/{admin_id}", response_model=Admin)
# def get_admin(admin_id: int):
#     cursor = conn.cursor()
#     cursor.execute("SELECT * FROM admin WHERE admin_id = ?", admin_id)
#     row = cursor.fetchone()
#     cursor.close()
#     if row:
#         return dict(zip(['admin_id', 'name', 'password', 'username'], row))
#     else:
#         raise HTTPException(status_code=404, detail="Admin not found")

# #
# @app.post("/admins/", response_model=Admin)
# def create_admin(admin: Admin):
#     cursor = conn.cursor()
#     cursor.execute(
#         "INSERT INTO admin (admin_id, Name,password,username) VALUES (?, ?,?,?)",
#     Admin.admin_id,Admin.name,Admin.password,Admin.username
#     )
#     conn.commit()
#     cursor.close()
#     return admin

# # 
# @app.put("/admins/{admin_id}", response_model=Admin)
# def update_admin(admin_id: int, admin: Admin):
#     cursor = conn.cursor()
#     cursor.execute(
#         "UPDATE admin SET Name=?,password=?,username=? WHERE admin_id=?",
#         admin.name,admin.password,admin.username,admin_id
#     )
#     conn.commit()
#     cursor.close()
#     return admin

# #
# @app.delete("/admins/{admin_id}")
# def delete_admin(admin_id: int):
#     cursor = conn.cursor()
#     cursor.execute("DELETE FROM admin WHERE admin_id=?", admin_id)
#     conn.commit()
#     cursor.close()
#     return {"message": "Admin deleted successfully"}
#############################################################
@app.get("/admin_contacts/{admin_id}", response_model=AdminContact)
def get_admin_contact(admin_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM admin_contact WHERE admin_id = ?", admin_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['contact', 'admin_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Admin_id not found")

#
@app.post("/admin_contacts/", response_model=AdminContact)
def create_admin_contact(admin_contact: AdminContact):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO admin_contact (contact,admin_id) VALUES (?, ?)",
    AdminContact.contact,AdminContact.admin_id
    )
    conn.commit()
    cursor.close()
    return admin_contact

# 
@app.put("/admin_contacts/{admin_id}", response_model=AdminContact)
def update_admin(admin_id: int, admin_contact: AdminContact):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE admin_contact SET contact=? WHERE admin_id=?",
        AdminContact.contact,admin_id
    )
    conn.commit()
    cursor.close()
    return admin_contact

#
@app.delete("/admin_contacts/{admin_id}")
def delete_admin(admin_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM admin_contact WHERE admin_id=?", admin_id)
    conn.commit()
    cursor.close()
    return {"message": "Admin_contact deleted successfully"}
##################################################################################
@app.get("/customers/{cust_id}", response_model=Customer)
def get_customer(cust_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM customer WHERE cust_id = ?", cust_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['cust_id', 'Name', 'E_mail', 'password', 'username', 'image'], row))
    else:
        raise HTTPException(status_code=404, detail="Customer not found")

@app.post("/customers/", response_model=Customer)
def create_customer(customer: Customer):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO customer (Name, E_mail, password, username, image) VALUES (?, ?, ?, ?, ?)",
        customer.Name, customer.E_mail, customer.password, customer.username, customer.image
    )
    conn.commit()
    cursor.close()
    return customer
# 
@app.put("/customers/{cust_id}", response_model=Customer)
def update_customer(cust_id: int, customer: Customer):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE customer SET Name=?,E_mail=?,password=?,username=?,image=? WHERE cust_id=?",
        customer.Name,customer.E_mail,customer.password,customer.username,customer.image,cust_id
    )
    conn.commit()
    cursor.close()
    return customer

#
@app.delete("/customers/{cust_id}")
def delete_customer(cust_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM customer WHERE cust_id=?", cust_id)
    conn.commit()
    cursor.close()
    return {"message": "customer deleted successfully"}
##############################################################
@app.get("/customer_contacts/{cust_id}", response_model=CustomerContact)
def get_customer_contact(cust_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM customer_contact WHERE cust_id = ?", cust_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['contact', 'cust_id'], row))
    else:
        raise HTTPException(status_code=404, detail="cust_id not found")

#
@app.post("/customer_contacts/", response_model=CustomerContact)
def create_customer_contact(customer_contact: CustomerContact):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO customer_contact (contact,cust_id) VALUES (?, ?)",
    customer_contact.contact,customer_contact.cust_id
    )
    conn.commit()
    cursor.close()
    return customer_contact

# 
@app.put("/customer_contacts/{customer_id}", response_model=CustomerContact)
def update_customer_contact(cust_id: int, customer_contact: CustomerContact):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE customer_contact SET contact=? WHERE cust_id=?",
        CustomerContact.contact,cust_id
    )
    conn.commit()
    cursor.close()
    return customer_contact



#
@app.delete("/customer_contacts/{customer_id}")
def delete_customer_contact(customer_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM customer_contact WHERE cust_id=?", customer_id)
    conn.commit()
    cursor.close()
    return {"message": "Admin_contact deleted successfully"}
#########################################
@app.get("/properties/{app_id}", response_model=Property)
def get_property(app_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM property WHERE app_id = ?", app_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['app_id', 'price','name','size','status','description','owner_id'], row))
    else:
        raise HTTPException(status_code=404, detail="property not found")

#
@app.post("/properties/", response_model=Property)
def create_property(property: Property):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO property ( 'price','Name','size','status','description','owner_id') VALUES (?,?,?,?,?,?)",
    property.price,property.name,property.size,property.status,property.description,property.owner_id
    )
    conn.commit()
    cursor.close()
    return property

# 
@app.put("/properties/{app_id}", response_model=Property)
def update_property(app_id: int, property: Property):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE property SET  'price'=?,'Name'=?,'size'=?,'status'=?,'description'=?,'owner_id'=? WHERE app_id=?",
        property.price,property.name,property.size,property.status,property.description,property.owner_id,app_id
    )
    conn.commit()
    cursor.close()
    return property

#
@app.delete("/properties/{app_id}")
def delete_admin(app_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM property WHERE app_id=?", app_id)
    conn.commit()
    cursor.close()
    return {"message": "AProperty deleted successfully"}

#########################################################################
@app.get("/rooms/{room_id}", response_model=Room)
def get_room(room_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM room WHERE room_id = ?", room_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['room_id', 'size','room_type','price','app_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Room_id not found")

#
@app.post("/rooms/", response_model=Room)
def create_room(room: Room):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO admin_contact ( 'size','room_type','price','app_id') VALUES ( ?,?,?,?)",
    room.size,room.room_type,room.price,room.app_id
    )
    conn.commit()
    cursor.close()
    return room

# 
@app.put("/rooms/{room_id}", response_model=Room)
def update_room(room_id: int, room: Room):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE room SET 'size'=?,'room_type'=?,'price'=?,'app_id'=? WHERE room_id=?",
        room.size,room.room_type,room.price,room.app_id,room_id)
    conn.commit()
    cursor.close()
    return room

#
@app.delete("/rooms/{admin_id}")
def delete_room(room_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM room WHERE room_id=?", room_id)
    conn.commit()
    cursor.close()
    return {"message": "room deleted successfully"}
#######################################################################################
##########################
###################
# Get operation for property addresses
@app.get("/property_addresses/{address}", response_model=PropertyAddress)
def get_property_address(address: str):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM property_address WHERE address = ?", address)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['address', 'app_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Property address not found")

# Post operation for property addresses
@app.post("/property_addresses/", response_model=PropertyAddress)
def create_property_address(property_address: PropertyAddress):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO property_address (address, app_id) VALUES (?, ?)",
        property_address.address, property_address.app_id
    )
    conn.commit()
    cursor.close()
    return property_address

# Put operation for property addresses
@app.put("/property_addresses/{address}", response_model=PropertyAddress)
def update_property_address(address: str, property_address: PropertyAddress):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE property_address SET app_id=? WHERE address=?",
        property_address.app_id, address
    )
    conn.commit()
    cursor.close()
    return property_address

# Delete operation for property addresses
@app.delete("/property_addresses/{address}")
def delete_property_address(address: str):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM property_address WHERE address=?", address)
    conn.commit()
    cursor.close()
    return {"message": "Property address deleted successfully"}

# Get operation for property images
@app.get("/property_images/{img_id}", response_model=PropertyImage)
def get_property_image(img_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM property_image WHERE img_id = ?", img_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['img_id', 'description', 'app_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Property image not found")

# Post operation for property images
@app.post("/property_images/", response_model=PropertyImage)
def create_property_image(property_image: PropertyImage):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO property_image (description, app_id) VALUES (?, ?)",
        property_image.description, property_image.app_id
    )
    conn.commit()
    cursor.close()
    return property_image

# Put operation for property images
@app.put("/property_images/{img_id}", response_model=PropertyImage)
def update_property_image(img_id: int, property_image: PropertyImage):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE property_image SET description=?, app_id=? WHERE img_id=?",
        property_image.description, property_image.app_id, img_id
    )
    conn.commit()
    cursor.close()
    return property_image

# Delete operation for property images
@app.delete("/property_images/{img_id}")
def delete_property_image(img_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM property_image WHERE img_id=?", img_id)
    conn.commit()
    cursor.close()
    return {"message": "Property image deleted successfully"}
###########################
####################
###############
# Get operation for notifications
@app.get("/notifications/{notification_id}", response_model=Notification)
def get_notification(notification_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM notification WHERE notification_id = ?", notification_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['notification_id', 'Name', 'description', 'admin_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Notification not found")

# Post operation for notifications
@app.post("/notifications/", response_model=Notification)
def create_notification(notification: Notification):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO notification (Name, description, admin_id) VALUES (?, ?, ?)",
        notification.name, notification.description, notification.admin_id
    )
    conn.commit()
    cursor.close()
    return notification

# Put operation for notifications
@app.put("/notifications/{notification_id}", response_model=Notification)
def update_notification(notification_id: int, notification: Notification):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE notification SET Name=?, description=?, admin_id=? WHERE notification_id=?",
        notification.name, notification.description, notification.admin_id, notification_id
    )
    conn.commit()
    cursor.close()
    return notification

# Delete operation for notifications
@app.delete("/notifications/{notification_id}")
def delete_notification(notification_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM notification WHERE notification_id=?", notification_id)
    conn.commit()
    cursor.close()
    return {"message": "Notification deleted successfully"}

###################################3
# Get operation for comments
@app.get("/comments/{comment_id}", response_model=Comment)
def get_comment(comment_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM comments WHERE comment_id = ?", comment_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['comment_id', 'comment', 'comment_date', 'comment_time', 'app_id', 'admin_id', 'cust_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Comment not found")

# Post operation for comments
@app.post("/comments/", response_model=Comment)
def create_comment(comment: Comment):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO comments (comment, comment_date, comment_time, app_id, admin_id, cust_id) VALUES (?, ?, ?, ?, ?, ?)",
        comment.comment, comment.comment_date, comment.comment_time, comment.app_id, comment.admin_id, comment.cust_id
    )
    conn.commit()
    cursor.close()
    return comment

# Put operation for comments
@app.put("/comments/{comment_id}", response_model=Comment)
def update_comment(comment_id: int, comment: Comment):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE comments SET comment=?, comment_date=?, comment_time=?, app_id=?, admin_id=?, cust_id=? WHERE comment_id=?",
        comment.comment, comment.comment_date, comment.comment_time, comment.app_id, comment.admin_id, comment.cust_id, comment_id
    )
    conn.commit()
    cursor.close()
    return comment

# Delete operation for comments
@app.delete("/comments/{comment_id}")
def delete_comment(comment_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM comments WHERE comment_id=?", comment_id)
    conn.commit()
    cursor.close()
    return {"message": "Comment deleted successfully"}

################################################################
# Get operation for appointments
@app.get("/appointments/{appointment_id}", response_model=Appointment)
def get_appointment(appointment_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM appointment WHERE appointment_id = ?", appointment_id)
    row = cursor.fetchone()
    cursor.close()
    if row:
        return dict(zip(['appointment_id', 'date', 'time', 'status', 'owner_id', 'admin_id', 'cust_id'], row))
    else:
        raise HTTPException(status_code=404, detail="Appointment not found")

# Post operation for appointments
@app.post("/appointments/", response_model=Appointment)
def create_appointment(appointment: Appointment):
    cursor = conn.cursor()
    cursor.execute(
        "INSERT INTO appointment (date, time, status, owner_id, admin_id, cust_id) VALUES (?, ?, ?, ?, ?, ?)",
        appointment.date, appointment.time, appointment.status, appointment.owner_id, appointment.admin_id, appointment.cust_id
    )
    conn.commit()
    cursor.close()
    return appointment

# Put operation for appointments
@app.put("/appointments/{appointment_id}", response_model=Appointment)
def update_appointment(appointment_id: int, appointment: Appointment):
    cursor = conn.cursor()
    cursor.execute(
        "UPDATE appointment SET date=?, time=?, status=?, owner_id=?, admin_id=?, cust_id=? WHERE appointment_id=?",
        appointment.date, appointment.time, appointment.status, appointment.owner_id, appointment.admin_id, appointment.cust_id, appointment_id
    )
    conn.commit()
    cursor.close()
    return appointment

# Delete operation for appointments
@app.delete("/appointments/{appointment_id}")
def delete_appointment(appointment_id: int):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM appointment WHERE appointment_id=?", appointment_id)
    conn.commit()
    cursor.close()
    return {"message": "Appointment deleted successfully"}


import uvicorn

if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8000)

