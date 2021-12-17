import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import 'steps/incrementing_steps.dart';

Future<void> main() async {
  final config = FlutterTestConfiguration()
    ..features = [RegExp('features/*.*.feature')]
    ..reporters = [ProgressReporter(), TestRunSummaryReporter()]
    ..stepDefinitions = [...incrementingStepsDefinitions]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";

  await GherkinRunner().execute(config);
}
