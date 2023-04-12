import 'package:mobile_authentication/model_service/model_service.dart';

abstract class DatabaseService {
  void addToDatabse<T extends ModelService>(T model, [String? collectionName]);
  void addWithDocId<T extends ModelService>(T model, [String? id]);
  void fetchOne(String id);
  Future<void> fetchOneWithCurrentUserID<T extends ModelService>(T model);
}
