/*

    Observação:
    
    Utilize o CMD, pois o Power Shell pode gerar erros, devido a falhas de interpretação dos comandos.

*/

// 01:

mongoexport --db "db_detran" --collection "proprietario" --out "C://Tarefas/MongoDB/Export/01/Proprietarios.json"

// 02:

mongoexport --db "db_detran" --collection "proprietario" --type "csv" --fields "_id,nome,cpf,id_endereco" --out "C://Tarefas/MongoDB/Export/02/Proprietarios.csv"

// 03:

mongoimport --db "db_hospital" --collection "paciente" --type "json" --file "C://Tarefas/MongoDB/Export/01/Proprietarios.json"

// 04:

mongoimport --db "db_petshop" --collection "cliente" --type "csv" --file "C://Tarefas/MongoDB/Export/02/Proprietarios.csv" --headerline

// 05:

mongoexport --db "db_detran" --collection "multa" --query "{\"local\": \"Praça do Centro\"}" --out "C://Tarefas/MongoDB/Export/05/Multas_Praca_Centro.json" --pretty

// 06:

mongoexport --db "db_detran" --collection "infracao" --sort "{\"valor\": -1}" --limit 5 --out "C://Tarefas/MongoDB/Export/06/Top_5_Infracoes.json" --pretty

// 07:

mongoexport --db "db_detran" --collection "agente" --out "C://Tarefas/MongoDB/Export/07/Agentes.json" --jsonArray

// 08:

mongoexport --uri="mongodb://admin:1234@mongo.detran.sp.gov.br:27017/db_detran" --collection "agente" --type "json" --out "C://Tarefas/MongoDB/Export/08/Agentes_Remoto.json"