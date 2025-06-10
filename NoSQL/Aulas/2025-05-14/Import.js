// Comando básico (Geral).

mongoimport --db "db_detran" --collection "agente" --file "C://Exports/MongoDB/Geral/Agentes.json"

mongoimport --db "db_detran" --collection "cidade" --file "C://Exports/MongoDB/Geral/Cidades.json"

mongoimport --db "db_detran" --collection "cor" --file "C://Exports/MongoDB/Geral/Cores.json"

mongoimport --db "db_detran" --collection "endereco" --file "C://Exports/MongoDB/Geral/Enderecos.json"

mongoimport --db "db_detran" --collection "estado" --file "C://Exports/MongoDB/Geral/Estados.json"

mongoimport --db "db_detran" --collection "infracao" --file "C://Exports/MongoDB/Geral/Infracoes.json"

mongoimport --db "db_detran" --collection "marca" --file "C://Exports/MongoDB/Geral/Marcas.json"

mongoimport --db "db_detran" --collection "modelo" --file "C://Exports/MongoDB/Geral/Modelos.json"

mongoimport --db "db_detran" --collection "multa" --file "C://Exports/MongoDB/Geral/Multas.json"

mongoimport --db "db_detran" --collection "proprietario" --file "C://Exports/MongoDB/Geral/Proprietarios.json"

mongoimport --db "db_detran" --collection "sexo" --file "C://Exports/MongoDB/Geral/Sexos.json"

mongoimport --db "db_detran" --collection "veiculo" --file "C://Exports/MongoDB/Geral/Veiculos.json"

// Importando um JSON cuja estrutura base é um array.

mongoimport --db "db_detran" --collection "sexo" --file "C://Exports/Testes/Array/Sexos.json" --jsonArray

// Importando um CSV que possui um cabeçalho.

mongoimport --db "db_detran" --collection "endereco" --type "csv" --file "C://Exports/MongoDB/Autenticado/Enderecos.csv" --headerline

// Importando um CSV que não possui um cabeçalho.

/*

    Considerações:

    - Os valores especificados no campo "--fields" não devem conter espaços, mas sim, apenas vírgulas, separando os títulos do cabeçalho.

*/

mongoimport --db "db_detran" --collection "agente" --type "csv" --fields "_id,primeiro_nome,matricula,tipo_contratacao,id_sexo" --file "C://Exports/Testes/CSV/Agentes.csv"

// Utilizando uma conexão autenticada.

mongoimport --uri="mongodb://root:detran@localhost:27017/db_detran" --collection "endereco" --type "json" --file "C://Exports/MongoDB/Autenticado/Enderecos.json"

mongoimport --uri="mongodb://root:detran@localhost:27017/db_detran" --collection "endereco" --type "csv" --file "C://Exports/MongoDB/Autenticado/Enderecos.csv" --headerline