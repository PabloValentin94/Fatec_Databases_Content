// Comando básico (Geral).

mongorestore "C://Backups/MongoDB/Autenticado/db_detran/agente.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/cidade.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/cor.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/endereco.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/estado.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/infracao.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/marca.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/modelo.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/multa.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/proprietario.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/sexo.bson"
mongorestore "C://Backups/MongoDB/Autenticado/db_detran/veiculo.bson"

// Restaurando vários backups a partir de uma pasta raíz.

mongorestore --dir "C://Backups/MongoDB/Autenticado/db_detran" --drop

// Utilizando parâmetros.

db.multa.drop();

mongorestore "C://Backups/MongoDB/Autenticado/db_detran/multa.bson" --db "db_detran" --collection "multa"

// Sobrescrevendo os dados de um banco de dados com um arquivo de backup.

mongorestore --drop --archive="C://Backups/MongoDB/Arquivo/Detran.archive"

// Sobrescrevendo os dados de um banco de dados com um arquivo de backup (GZIP).

mongorestore --drop --archive="C://Backups/MongoDB/GZIP/Detran.archive" --gzip