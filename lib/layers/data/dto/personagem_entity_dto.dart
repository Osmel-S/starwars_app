import 'package:starwars_app/layers/domain/entities/personagem_entity.dart';

class PersonagemEntityDto extends PersonagemEntity {
  String nome;
  String corDosOlhos;
  String altura;

  PersonagemEntityDto(
      {required this.nome, required this.corDosOlhos, required this.altura})
      : super(nome: nome, corDosOlhos: corDosOlhos, altura: altura);

  static PersonagemEntityDto fromMap(Map map) {
    return PersonagemEntityDto(
        nome: map['name'],
        corDosOlhos: map['eye_color'],
        altura: map['height']);
  }

  @override
  String toString() {
    return "Nome: " + nome;
  }
}
