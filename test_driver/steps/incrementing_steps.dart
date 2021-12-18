import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/home_page.dart';

final incrementingStepsDefinitions = [
  _incrementCounterNTimes,
  _thenCounterDisplaysX,
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

final StepDefinitionGeneric _thenCounterDisplaysX = then1<String, FlutterWorld>(
  "the counter displays {String}",
  (counterValue, context) async {
    final homePage = HomePage(driver: context.world.driver!);

    final actualValue = await homePage.getCounterValue();

    assert(actualValue == counterValue);
  },
);
