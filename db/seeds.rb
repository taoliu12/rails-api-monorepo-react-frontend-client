#  **** SEED FILE LOGIC REMINDER **** 


puts "Starting Seeding...."


# We DESTORY from Dependent -> Independent

WooblySnack.destroy_all

Woobly.destroy_all

Snack.destroy_all
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

sam = User.create(  

    name: "Sam",
    username: "SamBob",
    email: "Sam@Woobly.net",
    password: "123" 

    #X#
    # password_digest: "123" 

)
# t.string :password  ->  salt + hashing   ->  :password_digest


amy = User.create(  

    name: "Amy",
    username: "AmyYay",
    email: "Amy@Woobly.net",

    password: "123" 

)


sakinah = User.create(  

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

# User -< Wooblies -< Merchandise (Sales) >- Snacks
# User  >  Snack  >  Woobly  >  Sale






puts "Seeding New Snacks...."


ice_cream  = Snack.create( name: "ice cream" )
chips      = Snack.create( name: "chips")
pineapples = Snack.create( name: "pineapples" )



puts "Seeding New Wooblies...."
# U -< [] Woobly


woobly = Woobly.create( name: "Woobly", user_id: sam.id )
joobly = Woobly.create( name: "WaWaW",  user: sam )

wawawa = Woobly.create( name: "Joobly", user_id: amy.id )




puts "Seeding New WooblySnacks...."
# Woobly -< [] WooblySnack [] >- Snack


WooblySnack.create( price: 5.55, woobly_id: woobly.id, snack_id: ice_cream.id )
WooblySnack.create( price: 5.55, woobly:    woobly,    snack:    chips )

WooblySnack.create( price: 4.00, woobly:    joobly,    snack:    chips )








puts "Done Seeding....YAY!!!!"
