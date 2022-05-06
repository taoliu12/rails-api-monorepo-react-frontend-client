#  **** SEED FILE LOGIC REMINDER **** 


puts "Starting Seeding...."


# We DESTORY from Dependent -> Independent

User.destroy_all


puts "Removing Previous Data...."




puts "Seeding New Data...."

# We Create from Independent -> Dependent


puts "Seeding New Users...."

# [

#     {"id":1,"name":"Sam","username":"SamBob","email":"Sam@Woobly.net","password_digest":"123"},

#     {"id":2,"name":"Amy","username":"AmyYay","email":"Amy@Woobly.net",            "password_digest":"$2a$12$ cdYFecdVSE21WcVgCQoyJuuEdnoGPCN2iopsEVTrLJcrIZZKFQOzG"},
#     {"id":3,"name":"Sakinah","username":"sannaishaq","email":"Sakinah@Woobly.net","password_digest":"$2a$12$ eWOBOEUwU65XLA5iNDUGFuF8BeagdPJsgZB2wP4Nka2j2fzw0hWLi"}

# ]

User.create(  

    name: "Sam",
    username: "SamBob",
    email: "Sam@Woobly.net",
    password: "123" 

    #X#
    # password_digest: "123" 

)
# t.string :password  ->  salt + hashing   ->  :password_digest


User.create(  

    name: "Amy",
    username: "AmyYay",
    email: "Amy@Woobly.net",

    password: "123" 

)


User.create(  

    name: "Sakinah",
    username: "sannaishaq",
    email: "Sakinah@Woobly.net",

    password: "123" 

)


# User 

# t.string :name

# t.string :username
# t.string :email

# t.string :password  ->  :password_digest

# User -< Wooblies -< Sales >- Snacks
# User  >  Snack  >  Woobly  >  Sale




puts "Done Seeding....YAY!!!!"
