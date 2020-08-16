import 'package:flutter/material.dart';
import 'package:lost_angeles/ui/router.dart';
import 'package:lost_angeles/ui/styles/app_styles.dart';
import 'package:provider/provider.dart';
import 'core/models/job.dart';
import 'core/models/safe_area_dimensions.dart';
import 'core/services/job_service.dart';
import 'core/services/navigation_service.dart';
import 'core/services/safe_area_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<SafeAreaDimensions>(
          initialData: new SafeAreaDimensions(height: 0, width: 0),
          create: (context) =>
              locator<SafeAreaService>().safeAreaController.stream,
        ),
        StreamProvider<List<Job>>(
          initialData: new List<Job>(),
          create: (context) => locator<JobService>().jobsController.stream,
        ),
        StreamProvider<Job>(
          initialData: new Job(),
          create: (context) => locator<JobService>().jobController.stream,
        )
      ],
      child: MaterialApp(
        title: 'Lost Angeles',
        theme: ThemeData(
            accentColor: AppColours.accentColour,
            cursorColor: AppColours.primaryColour),
        initialRoute: '/jobs',
        onGenerateRoute: Router.generateRoute,
        navigatorKey: locator<NavigationService>().navigatorKey,
      ),
    );
  }
}
