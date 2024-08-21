import 'package:get_it/get_it.dart';

import '../di/database_module.dart' as database_module;
import '../di/datasource_module.dart' as datasource_module;
import '../di/repository_module.dart' as repository_module;
import '../di/usecase_module.dart' as usecase_module;
import '../di/bloc_module.dart' as bloc_module;

final locator = GetIt.instance;

init() async {
  await database_module.init();
  datasource_module.init();
  repository_module.init();
  usecase_module.init();
  bloc_module.init();
}
