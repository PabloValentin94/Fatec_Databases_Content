db.usuarios.aggregate([

    {$addFields: {

        total_gasto: {$sum: "$compras"},
        media_compra: {$avg: "$compras"}

    }},

    /*

        Não é possível referenciar um campo que ainda está em construção pelo 
        estágio da pipeline. Devido a isso, é preciso dividir a lógica em dois 
        estágios (O estágio anterior define o campo que será usado, enquanto o 
        estágio a seguir, irá definir um novo campo com base no valor do campo 
        gerado, que agora já existe.).

    */

    {$addFields: {

        classificacao_gasto: {$cond: {
            
            if: {$gte: ["$total_gasto", 200]},
            then: "Alto",
            else: {$cond: {
                
                if: {$lt: ["$total_gasto", 100]},
                then: "Baixo",
                else: "Médio"

            }}

        }}

    }}

]).pretty();
