import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/home_page.dart';

final incrementingStepsDefinitions = [
  _incrementCounterNTimes,
];

final StepDefinitionGeneric _incrementCounterNTimes = when1<int, FlutterWorld>(
  "the user increments the counter {int} times",
  (count, context) async {
    final homePage = HomePage(driver: context.world.driver!);

    for (var i = 0; i < count; i++) {
      await homePage.incrementCounter();
    }
  },
);
