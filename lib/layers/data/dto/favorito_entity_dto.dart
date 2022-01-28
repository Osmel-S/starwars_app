class Favorito {
  int? id;
  String nome;

  Favorito({ this.id, required this.nome});

  factory Favorito.fromMap(Map<String, dynamic> json) =>
      new Favorito(id: json['id'], nome: json['nome']);

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome};
  }

  Map<String, String> toMapString(String nome) {
    return {'nome': nome};
  }

  @override
  String toString() {
    return "nome: " + nome;
  }
}
