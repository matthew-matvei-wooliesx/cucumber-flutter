import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart' hide find;
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenCounterStartsAtX() => given1<String, FlutterWorld>(
      "the counter starts at {String}",
      (counterValue, context) async {
        final currentValue = await FlutterDriverUtils.getText(
          context.world.driver!,
          _findCounter(),
        );

        var current = int.parse(currentValue);
        final counter = int.parse(counterValue);

        if (current > counter) {
          throw StateError(
            "Failed to prepare counter, since initial value of $currentValue is already higher than $counterValue",
          );
        }

        while (current < counter) {
          await FlutterDriverUtils.tap(
            context.world.driver,
            _findIncrementer(),
          );

          current++;
        }
      },
    );

StepDefinitionGeneric incrementCounterNTimes() => when1<int, FlutterWorld>(
      "the user increments the counter {int} times",
      (count, context) async {
        for (var i = 0; i < count; i++) {
          await FlutterDriverUtils.tap(
            context.world.driver,
            _findIncrementer(),
          );
        }
      },
    );

StepDefinitionGeneric thenCounterDisplaysX() => then1<String, FlutterWorld>(
      "the counter displays {String}",
      (counterValue, context) async {
        final actualValue = await FlutterDriverUtils.getText(
          context.world.driver!,
          _findCounter(),
        );

        expect(actualValue, counterValue);
      },
    );

SerializableFinder _findCounter() => find.byValueKey("counter");
SerializableFinder _findIncrementer() => find.byValueKey("incrementer");
