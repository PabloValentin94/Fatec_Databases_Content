// 01:

use db_detran;

db.getUsers();

db.createUser({
    
    user:"cidadao",
    pwd: "1234",
    roles: [
        
        {role: "read", db: "db_detran"}
    
    ]

});

db.getUser("cidadao");

// 02:

use db_detran;

db.getUsers();

db.createUser({
    
    user: "agente",
    pwd: "abc123",
    roles: [
        
        {role: "readWrite", db: "db_detran"}
    
    ]

});

db.getUser("agente");

// 03:

use db_detran;

db.getUsers();

db.createUser({
    
    user: "admin_governo",
    pwd: "admin321",
    roles: [
        
        {role: "userAdmin", db: "dn_detran"}
    
    ]

});

db.getUser("admin_governo");

// 04:

use db_detran;

db.getUsers();

db.getUser("cidadao");

db.getUser("agente");

db.getUser("admin_governo");

// 05:

db.changeUserPassword("cidadao", "novaSenha456");

// 06:

use db_petshop;

db.getRoles({showBuiltinRoles: false});

db.createRole({
    
    role: "visualizador_produtos",
    privileges: [

        {resource: {db: "db_petshop", collection: "produtos"}, actions: ["find"]}

    ],
    roles: []

});

db.getRoles({showBuiltinRoles: false});

// 07:

use db_petshop;

db.getUsers();

db.createUser({user: "balconista", pwd: "balconista@teste", roles: []});

db.getUsers();

db.getRole("visualizador_produtos", {showPrivileges: true});

db.grantRolesToUser("balconista", [
    
    {role: "visualizador_produtos", db: "db_petshop"}

]);

db.getUser("balconista");

// 08:

use db_petshop;

db.getRole("visualizador_produtos", {showPrivileges: true});

db.grantPrivilegesToRole("visualizador_produtos", [

    {resource: {db: "db_petshop", collection: "produtos"}, actions: ["collStats"]}

]);

db.getRole("visualizador_produtos", {showPrivileges: true});

// 09:

use db_petshop;

db.getUser("balconista");

db.revokeRolesFromUser("balconista", [

    {role: "visualizador_produtos", db: "db_petshop"}

]);

db.getUser("balconista");

db.getRoles({showBuiltinRoles: false});

db.dropRole("visualizador_produtos");

db.getRoles({showBuiltinRoles: false});

// 10:

db.getRoles({showBuiltinRoles: false});

db.createRole({

    role: "root",
    privileges: [

        {resource: {db: "db_petshop", collection: "produtos"}, actions: ["find"]}
        
    ],
    roles: []

});

db.getRoles({showBuiltinRoles: false});

db.getUsers();

db.createUser({user: "root_user", pwd: "super123", roles: [

    {role: "root", db: "db_petshop"}

]});

db.getUser("root_user");