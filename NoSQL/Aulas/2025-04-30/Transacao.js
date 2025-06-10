// Iniciando uma sessão no MongoDB.

const sessao = db.getMongo().startSession();

// Obtendo as coleções que serão utilizadas na transação.

const clientes = sessao.getDatabase("loja").clientes;

const pedidos = sessao.getDatabase("loja").pedidos;

// Iniciando uma transação.

sessao.startTransaction();

// Executando a transação.

try {

    // Executando ações de teste.

    clientes.updateOne({nome: "João"}, {$set: {status: "Inativo"}});

    pedidos.insertOne({

        cliente: "João",
        produto: "Teclado",
        valor: 200

    });

    // Confirmando as ações executadas (Não há persistência até que isso seja executado.).

    sessao.commitTransaction();

    print("Sucesso! Transação concluída.");

} catch(error) {

    // Abortando/Revertendo tudo que foi executado até agora dentro da transação.

    sessao.abortTransaction();

    print("Erro! Transação abortada.");

} finally {

    // Encerrando a sessão atual.

    sessao.endSession();

}