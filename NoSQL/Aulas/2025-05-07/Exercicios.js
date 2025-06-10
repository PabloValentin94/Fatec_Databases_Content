/*

    Observação:
    
    Utilize o CMD, pois o Power Shell pode gerar erros, devido a falhas de interpretação dos comandos.

*/

// 01:

mongodump --db "db_detran" --out "C://Backups/Detran/Geral"

// 02:

mongodump --db "db_detran" --collection "proprietario" --out "C://Backups/Detran/Proprietario"

// 03:

mongorestore --dir "C://Backups/Detran/Geral" --drop

// 04:

db.multa.find({$expr: {$eq: [{$year: "$horario_multa"}, 2025]}}).pretty();

mongodump --db "db_detran" --collection "multa" --query "{\"$expr\": {\"$eq\": [{\"$year\": \"$horario_multa\"}, 2025]}}" --out "C://Backups/Detran/Multa/2025"

// 05:

mongorestore "C://Backups/Detran/Multa/2025/db_detran/multa.bson" --db "db_detran" --collection "multa" --drop

// 06:

mongodump --db "db_hospital" --archive="C://Backups/Hospital/Geral/Hospital.archive"

// 07:

mongorestore --archive="C://Backups/Hospital/Geral/Hospital.archive" --drop

// 08:

mongodump --db "db_petshop" --archive="C://Backups/Petshop/Geral/Petshop.archive" --gzip

// 09:

mongorestore --db "db_petshop" --collection "cliente" --archive="C://Backups/Petshop/Geral/Petshop.archive" --gzip --drop