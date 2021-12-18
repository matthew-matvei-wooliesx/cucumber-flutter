import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/home_page.dart';

final counterStepsDefinitions = [
  _givenCounterStartsAtX,
  _thenCounterDisplaysX,
];

final StepDefinitionGeneric _givenCounterStartsAtX =
    given1<String, FlutterWorld>(
  "the counter starts at {String}",
  (counterValue, context) async {
    final homePage = HomePage(driver: context.world.driver!);

    final currentValue = await homePage.getCounterValue();

    var current = int.parse(currentValue);
    final counter = int.parse(counterValue);

    if (current > counter) {
      throw StateError(
        "Failed to prepare counter, since initial value of $currentValue is already higher than $counterValue",
      );
    }

    while (current < counter) {
      await homePage.incrementCounter();

      current++;
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
