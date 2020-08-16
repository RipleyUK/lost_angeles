import 'package:lost_angeles/core/models/job_route.dart';

class RouteService {
  List<int> routeA = new List<int>()
    ..add(1)
    ..add(13)
    ..add(12)
    ..add(11)
    ..add(10)
    ..add(9);
  List<int> routeB = new List<int>()
    ..add(1)
    ..add(13)
    ..add(16)
    ..add(15)
    ..add(14)
    ..add(8);
  List<int> routeC = new List<int>()
    ..add(1)
    ..add(2)
    ..add(3)
    ..add(4)
    ..add(5)
    ..add(6)
    ..add(7);

  JobRoute calculateRoute(int caravan) {
    if (routeA.any((routeCaravan) => routeCaravan == caravan)) {
      return new JobRoute(
          duration: routeA.indexOf(caravan) + 1 * 1,
          path: routeA.take(routeA.indexOf(caravan) + 1).toList());
    } else if (routeB.any((routeCaravan) => routeCaravan == caravan)) {
      return new JobRoute(
          duration: routeB.indexOf(caravan) + 1 * 1,
          path: routeB.take(routeB.indexOf(caravan) + 1).toList());
    } else if (routeC.any((routeCaravan) => routeCaravan == caravan)) {
      return new JobRoute(
          duration: routeC.indexOf(caravan) + 1 * 1,
          path: routeC.take(routeC.indexOf(caravan) + 1).toList());
    }

    return null;
  }
}
