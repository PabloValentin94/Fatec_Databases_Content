// Comando básico (Geral).

mongodump --out "C://Backups/MongoDB/Geral" // A pasta é criada automaticamente.

// Utilizando parãmetros.

mongodump --db "db_detran" --collection "multa" --out "C://Backups/MongoDB/Especifico" // A pasta é criada automaticamente.

// Utilizando uma conexão autenticada.

use db_detran;

db.createUser({user: "root", pwd: "detran", roles: ["dbOwner"]});

mongodump --uri="mongodb://root:detran@localhost:27017/db_detran" --out "C://Backups/MongoDB/Autenticado" // A pasta é criada automaticamente.

// Gerando o backup em um único arquivo.

mongodump --db "db_detran" --archive="C://Backups/MongoDB/Arquivo/Detran.archive" // A pasta não é criada automaticamente.

// Gerando o backup em um único arquivo com o conteúdo compactado.

mongodump --db "db_detran" --archive="C://Backups/MongoDB/GZIP/Detran.archive" --gzip // A pasta não é criada automaticamente.