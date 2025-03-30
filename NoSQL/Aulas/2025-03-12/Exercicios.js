use db_teste;

db.createCollection("heroes");

db.heroes.insertMany([

    {"_id": 1, "name": "Spider-Man", "city": "New York", "powers": ["Agility", "Web-Shooting"], "defeated_villains": 50},
    {"_id": 2, "name": "Batman", "city": "Gotham", "powers": ["Martial Arts", "Detective Skills"], "defeated_villains": 200},
    {"_id": 3, "name": "Wonder Woman", "city": "Themyscira", "powers": ["Super Strength", "Lasso of Truth"], "defeated_villains": 120}

]);

db.heroes.find();

db.createCollection("foods");

db.foods.insertMany([

    {"_id": 1, "dish": "Pizza", "ingredients": ["Dough", "Tomato Sauce", "Cheese"], "price": 30},
    {"_id": 2, "dish": "Sushi", "ingredients": ["Rice", "Fish", "Seaweed"], "price": 40},
    {"_id": 3, "dish": "Taco", "ingredients": ["Tortilla", "Beef", "Cheese"], "price": 15}

]);

db.foods.find();

// 01:

db.heroes.updateOne({"name": "Spider-Man"}, {$push: {"powers": "Aprimored Spider-Sense"}});

db.heroes.updateOne({"name": "Batman"}, {$inc: {"defeated_villains": 10}});

db.heroes.updateOne({"name": "Wonder Woman"}, {$set: {"city": "Amazonia"}});

db.heroes.updateOne({"name": "Batman"}, {$pull: {"powers": "Detective Skills"}});

// 02:

db.foods.updateMany({}, {$mul: {"price": 1.10}});

db.foods.updateOne({"dish": "Taco"}, {$push: {"ingredients": "Guacamole"}});

db.foods.updateOne({"dish": "Sushi"}, {$set: {"price": 35}});

db.foods.updateOne({"dish": "Taco"}, {$pull: {"ingredients": "Beef"}});
db.foods.updateOne({"dish": "Taco"}, {$push: {"ingredients": "Chicken"}});