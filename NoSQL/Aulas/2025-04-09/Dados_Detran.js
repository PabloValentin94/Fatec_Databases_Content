// Banco de Dados.

use db_detran;

// Coleções.

db.createCollection("sexo");

db.createCollection("endereco");

db.createCollection("cor");

db.createCollection("marca");

db.createCollection("infracao");

db.createCollection("estado");

db.createCollection("agente");

db.createCollection("modelo");

db.createCollection("cidade");

db.createCollection("proprietario");

db.createCollection("veiculo");

db.createCollection("multa");

// Verificação da Estrutura do Banco de Dados.

show dbs;

show collections;

// Documentos de Teste.

db.sexo.insertMany([

    {_id: 1, nome: "Masculino", inicial: "M"},
    {_id: 2, nome: "Feminino", inicial: "F"}

]);

db.endereco.insertOne({

    _id: 1,
    cep: "14240000",
    bairro: "Centro",
    numero: "667",
    logradouro: "Rua dos Professores",
    complemento: "Casa"

});

db.cor.insertMany([

    {_id: 1, nome: "Vermelho"},
    {_id: 2, nome: "Branco"},
    {_id: 3, nome: "Azul"},
    {_id: 4, nome: "Verde"},
    {_id: 5, nome: "Preto"}

]);

db.marca.insertMany([

    {_id: 1, nome: "Volkswagen"},
    {_id: 2, nome: "Chevrolet"},
    {_id: 3, nome: "Fiat"},
    {_id: 4, nome: "Ford"},
    {_id: 5, nome: "Peugeot"},
    {_id: 6, nome: "Renault"}

]);

db.infracao.insertMany([

    {_id: 1, descricao: "Excesso, de até 20%, da velocidade máxima permitida no trajeto.", pontos: 0, valor: 0.00},
    {_id: 2, descricao: "Avanço de sinal vermelho do semáforo ou de parada obrigatória.", pontos: 0, valor: 0.00},
    {_id: 3, descricao: "Ausência do cinto de segurança.", pontos: 0, valor: 0.00}

]);

db.estado.insertMany([

    {_id: 1, nome: "São Paulo", sigla: "SP"},
    {_id: 2, nome: "Minas Gerais", sigla: "MG"},
    {_id: 3, nome: "Paraná", sigla: "PR"}

]);

db.agente.insertMany([

    {_id: 1, nome: "João", matricula: "123", contratacao: "CLT", id_sexo: 1},
    {_id: 2, nome: "Maria", matricula: "456", contratacao: "CLT", id_sexo: 2},
    {_id: 3, nome: "Antônio", matricula: "789", contratacao: "CLT", id_sexo: 1}

]);

db.modelo.insertMany([

    {_id: 1, nome: "Polo", id_marca: 1},
    {_id: 2, nome: "Fusca", id_marca: 1},
    {_id: 3, nome: "Chevette", id_marca: 2},
    {_id: 4, nome: "Pálio", id_marca: 3},
    {_id: 5, nome: "Ká", id_marca: 4},
    {_id: 6, nome: "Gol", id_marca: 1},
    {_id: 7, nome: "Opala", id_marca: 2}

]);

db.cidade.insertMany([

    {_id: 1, nome: "Mococa", id_estado: 1},
    {_id: 2, nome: "Cajuru", id_estado: 1},
    {_id: 3, nome: "Guaxupé", id_estado: 2},
    {_id: 4, nome: "Curitiba", id_estado: 3}

]);

db.proprietario.insertOne({

    _id: 1,
    nome: "Prof. Tiago",
    cpf : "12345678910",
    id_sexo: 1,
    id_cidade: 2,
    id_endereco: 1

});

db.veiculo.insertMany([

    {_id: 1, placa: "EVA4960", cadastro: "Tiagotas", id_proprietario: 1, id_modelo: 1, id_cor: 2},
    {_id: 2, placa: "BLD7764", cadastro: "Tiagotas", id_proprietario: 1, id_modelo: 2, id_cor: 2},
    {_id: 3, placa: "CFU0412", cadastro: "Tiagotas", id_proprietario: 1, id_modelo: 6, id_cor: 3},
    {_id: 4, placa: "ZZZ0666", cadastro: "Troco", id_proprietario: 1, id_modelo: 7, id_cor: 5}

]);

db.multa.insertMany([

    {_id: 1, lancamento: "Condutor sem vergonha.", local: "Praça do Centro", horario_multa: ISODate("2018-12-30T00:22:00Z"), id_veiculo: 1, id_cidade: 3, id_infracao: 2, id_agente: 3},
    {_id: 2, lancamento: "Condutor com camisa do Vasco.", local: "Avenida do Rio", horario_multa: ISODate("2018-12-31T08:15:00Z"), id_veiculo: 1, id_cidade: 2, id_infracao: 3, id_agente: 1},
    {_id: 3, lancamento: "Condutor tocando música de domingo a noite.", local: "Vale da Sofrência", horario_multa: ISODate("2018-12-31T11:30:00Z"), id_veiculo: 1, id_cidade: 1, id_infracao: 3, id_agente: 2}

]);

// Documentos Extras.

db.endereco.insertMany([

    {_id: 2, cep: "14240000", bairro: "Centro", numero: "2", logradouro: "Rua dos Multados", complemento: "Casa"},
    {_id: 3, cep: "13240000", bairro: "Jardim das Trevas", numero: "89", logradouro: "Rua José Bonifácio", complemento: "Comércio"},
    {_id: 4, cep: "14240000", bairro: "Centro", numero: "66", logradouro: "Avenida José Santos", complemento: "Casa"},
    {_id: 5, cep: "12240000", bairro: "Quebrada", numero: "100", logradouro: "Rua Antônio dos Santos", complemento: "Casa"}

]);

db.proprietario.insertMany([

    {_id: 2, nome: "João", cpf: "12345678911", id_sexo: 1, id_cidade: 1, id_endereco: 2},
    {_id: 3, nome: "Juca", cpf: "12354896214", id_sexo: 1, id_cidade: 2, id_endereco: 3},
    {_id: 4, nome: "Maria", cpf: "78923578214", id_sexo: 2, id_cidade: 3, id_endereco: 4},
    {_id: 5, nome: "Zé", cpf: "96532578921", id_sexo: 1, id_cidade: 4, id_endereco: 5}

]);

db.veiculo.insertMany([

    {_id: 5, placa: "YDX5892", cadastro: "Licenciado", id_proprietario: 2, id_modelo: 3, id_cor: 1},
    {_id: 6, placa: "KYN0169", cadastro: "Licenciado", id_proprietario: 3, id_modelo: 4, id_cor: 2},
    {_id: 7, placa: "OKY0101", cadastro: "Licenciado", id_proprietario: 4, id_modelo: 5, id_cor: 5},
    {_id: 8, placa: "YAG0101", cadastro: "Licenciado", id_proprietario: 5, id_modelo: 1, id_cor: 4}

]);

db.multa.insertMany([

    {_id: 4, lancamento: "Condutor muito feliz. Não permito.", local: "Uma rua aí", horario_multa: ISODate("2019-02-28T00:22:00Z"), id_veiculo: 2, id_cidade: 1, id_infracao: 1, id_agente: 1},
    {_id: 5, lancamento: "Condutor muito feliz. Não permito.", local: "Uma avenida aí", horario_multa: ISODate("2018-05-30T13:25:00Z"), id_veiculo: 2, id_cidade: 1, id_infracao: 1, id_agente: 2},
    {_id: 6, lancamento: "Condutor muito feliz. Não permito.", local: "Praça do Centro", horario_multa: ISODate("2019-05-30T14:33:00Z"), id_veiculo: 3, id_cidade: 3, id_infracao: 3, id_agente: 1},
    {_id: 7, lancamento: "Condutor muito feliz. Não permito.", local: "Praça José Gomes", horario_multa: ISODate("2017-03-14T15:30:00Z"), id_veiculo: 4, id_cidade: 3, id_infracao: 2, id_agente: 1},
    {_id: 8, lancamento: "Condutor muito feliz. Não permito.", local: "Uma rua aí", horario_multa: ISODate("2017-12-23T17:18:00Z"), id_veiculo: 5, id_cidade: 4, id_infracao: 2, id_agente: 3},
    {_id: 9, lancamento: "Condutor muito feliz. Não permito.", local: "Estacionamento", horario_multa: ISODate("2016-08-19T09:26:00Z"), id_veiculo: 1, id_cidade: 4, id_infracao: 3, id_agente: 3},
    {_id: 10, lancamento: "Condutor muito feliz. Não permito.", local: "Praça da Matriz", horario_multa: ISODate("2018-11-15T10:34:00Z"), id_veiculo: 1, id_cidade: 3, id_infracao: 1, id_agente: 1},
    {_id: 11, lancamento: "Condutor muito feliz. Não permito.", local: "Praça de Pedágio", horario_multa: ISODate("2019-01-28T15:23:00Z"), id_veiculo: 1, id_cidade: 3, id_infracao: 3, id_agente: 3}

]);