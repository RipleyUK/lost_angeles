import 'package:get_it/get_it.dart';
import 'package:lost_angeles/core/services/api_service.dart';
import 'package:lost_angeles/core/services/job_service.dart';
import 'package:lost_angeles/core/services/navigation_service.dart';
import 'package:lost_angeles/core/services/route_service.dart';

import 'core/services/safe_area_service.dart';
import 'core/viewmodels/jobs_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SafeAreaService());
  locator.registerLazySingleton(() => JobService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => RouteService());

  locator.registerFactory(() => JobsViewModel());
}
