import 'package:starwars_app/layers/domain/entities/filme_entity.dart';

abstract class GetFilmeDataSource {
  Future<List<FilmeEntity>> call();
}
