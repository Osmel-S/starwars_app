import 'package:starwars_app/layers/domain/entities/filme_entity.dart';

class FilmeEntityDto extends FilmeEntity {
  String titulo;
  int idEpisodio;
  String dataCriacao;

  FilmeEntityDto(
      {required this.titulo,
      required this.idEpisodio,
      required this.dataCriacao})
      : super(titulo: titulo, idEpisodio: idEpisodio, dataCriacao: dataCriacao);

  static FilmeEntityDto fromMap(Map map) {
    print('chegou');
    return FilmeEntityDto(
        titulo: map['title'],
        idEpisodio: map['episode_id'],
        dataCriacao: map['release_date']);
  }
}
