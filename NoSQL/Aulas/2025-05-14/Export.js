// Comando básico (Geral).

mongoexport --db "db_detran" --collection "agente" --out "C://Exports/MongoDB/Geral/Agentes.json"

mongoexport --db "db_detran" --collection "cidade" --out "C://Exports/MongoDB/Geral/Cidades.json"

mongoexport --db "db_detran" --collection "cor" --out "C://Exports/MongoDB/Geral/Cores.json"

mongoexport --db "db_detran" --collection "endereco" --out "C://Exports/MongoDB/Geral/Enderecos.json"

mongoexport --db "db_detran" --collection "estado" --out "C://Exports/MongoDB/Geral/Estados.json"

mongoexport --db "db_detran" --collection "infracao" --out "C://Exports/MongoDB/Geral/Infracoes.json"

mongoexport --db "db_detran" --collection "marca" --out "C://Exports/MongoDB/Geral/Marcas.json"

mongoexport --db "db_detran" --collection "modelo" --out "C://Exports/MongoDB/Geral/Modelos.json"

mongoexport --db "db_detran" --collection "multa" --out "C://Exports/MongoDB/Geral/Multas.json"

mongoexport --db "db_detran" --collection "proprietario" --out "C://Exports/MongoDB/Geral/Proprietarios.json"

mongoexport --db "db_detran" --collection "sexo" --out "C://Exports/MongoDB/Geral/Sexos.json"

mongoexport --db "db_detran" --collection "veiculo" --out "C://Exports/MongoDB/Geral/Veiculos.json"

// Aplicando um filtro.

mongoexport --db "db_detran" --collection "infracao" --query "{\"pontos\": {\"$gt\": 5}}" --out "C://Exports/MongoDB/Filtrados/Infracoes.json"

// Gerando um CSV com um cabeçalho.

/*

    Considerações:

    - Os valores especificados no campo "--fields" precisam ser os mesmos definidos na coleção do banco de dados;

    - Os valores especificados no campo "--fields" não devem conter espaços, mas sim, apenas vírgulas, separando os títulos do cabeçalho.

*/

mongoexport --db "db_detran" --collection "agente" --type "csv" --fields "_id,nome,matricula,contratacao,id_sexo" --out "C://Exports/MongoDB/CSV/Agentes.csv"

// Utilizando uma conexão autenticada.

mongoexport --uri="mongodb://root:detran@localhost:27017/db_detran" --collection "endereco" --type "json" --out "C://Exports/MongoDB/Autenticado/Enderecos.json"

mongoexport --uri="mongodb://root:detran@localhost:27017/db_detran" --collection "endereco" --type "csv" --fields "_id,cep,bairro,numero,logradouro,complemento" --out "C://Exports/MongoDB/Autenticado/Enderecos.csv"