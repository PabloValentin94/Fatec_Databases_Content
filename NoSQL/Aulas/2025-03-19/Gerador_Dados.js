// Execute com o NodeJS.

console.log("db.usuarios.insertMany([\n");

const quantidade_documentos = 100;

for (let i = 1; i <= quantidade_documentos; i++)
{

    let documento = `    {"nome": "Usuario${i}", "email": "Usuario${i}@email.com", "idade": ${Math.floor(Math.random() * 80) + 18}}`;

    if(i < quantidade_documentos)
    {

        documento = documento.concat(",");

    }

    console.log(documento);

}

console.log("\n]);");