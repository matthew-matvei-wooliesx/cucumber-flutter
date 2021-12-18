import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/home_page.dart';

final decrementingStepsDefinitions = [_decrementCounterNTimes];

final StepDefinitionGeneric _decrementCounterNTimes = when1<int, FlutterWorld>(
  "the user decrements the counter {int} time(s)",
  (count, context) async {
    final homePage = HomePage(driver: context.world.driver!);

    for (var i = 0; i < count; i++) {
      await homePage.decrementCounter();
    }
  },
);
