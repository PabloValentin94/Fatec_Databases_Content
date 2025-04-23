// Listagem compacta dos documentos de uma coleção.

db.pessoa.find();

// Listagem ampliada dos documentos de uma coleção (Se os documentos forem pequenos, não fará diferença.).

db.pessoa.find().pretty();

// Também é possível aplicar filtros nas consultas, utilizando operadores.