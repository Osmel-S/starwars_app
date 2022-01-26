
import 'package:starwars_app/layers/domain/entities/filme_entity.dart';

abstract class GetFilmeRepository{
  Future<List<FilmeEntity>> call ();
}