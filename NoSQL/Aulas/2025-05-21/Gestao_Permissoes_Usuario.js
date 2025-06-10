// Criando um usuário.

db.createUser({

    user: "Admin",
    pwd: "Fatec@2025",
    roles: [

        {role: "userAdminAnyDatabase", db: "db_admin"},

        "readWriteAnyDatabase"

    ]

});

// Atualizando os dados de um usuário.

db.updateUser("Admin", {

    pwd: "Fatec#2025",
    roles: [{role: "read", db: "db_vendas"}]

});

// Atualizando a senha de um usuário.

db.changeUserPassword("Admin", "Fatec@2025");

// Deletando um usuário.

db.dropUser("Admin");

// Ver as permissões de um usuário.

db.getUser("Admin");

// Ver todos os usuários existentes em um banco.

db.getUsers();

// Deletando todos os usuários.

db.dropAllUsers();

// Ver todas as permissões existentes no MongoDB.

db.getRoles({showBuiltinRoles: true});

// Criando uma permissão personalizada.

db.createRole({

    role: "showClients",
    privileges: [

        {

            resource: {db:"db_vendas", collection: "clientes"},
            actions: ["find"]

        }

    ],

    roles: []

});

// Exibindo todas as permissões personalizadas existentes no MongoDB.

db.getRoles({showBuiltinRoles: false});

// Exibir os detalhes de uma permissão personalizada.

db.getRole("showClients", {showPrivileges: true});

// Atribuindo uma permissão personalizada a um usuário.

db.grantRolesToUser("Admin", [{role: "showClients", db: "db_teste"}]);

// Removendo uma permissão personalizada de um usuário.

db.revokeRolesFromUser("Admin", [{role: "showClients", db: "db_teste"}]);

// Atribuindo ações à uma permissão.

db.grantPrivilegesToRole("showClients", [

    {resource: {db: "db_teste", collection: "clientes"}, actions: ["find", "count"]}

]);

// Removendo uma ação de uma permissão.

db.revokePrivilegesFromRole("showClients", [

    {resource: {db: "db_teste", collection: "clientes"}, actions: ["find"]}

]);

// Excluindo uma permissão personalizada.

db.dropRole("showClients");