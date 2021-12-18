import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import 'steps/counter_steps.dart';
import 'steps/decrementing_steps.dart';
import 'steps/incrementing_steps.dart';

Future<void> main() async {
  final config = FlutterTestConfiguration()
    ..features = [RegExp('features/*.*.feature')]
    ..reporters = [ProgressReporter(), TestRunSummaryReporter()]
    ..stepDefinitions = [
      ...counterStepsDefinitions,
      ...incrementingStepsDefinitions,
      ...decrementingStepsDefinitions,
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..tagExpression = "not @notYetImplemented";

  await GherkinRunner().execute(config);
}
