import 'package:starwars_app/layers/domain/entities/filme_entity.dart';

abstract class GetFilmeUseCase{
  Future<List<FilmeEntity>> call ();
}