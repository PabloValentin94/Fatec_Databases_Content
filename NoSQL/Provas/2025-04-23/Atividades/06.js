db.usuarios.aggregate([

    {$addFields: {

        total_gasto: {$sum: "$compras"},
        media_compra: {$avg: "$compras"},
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