import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class HomePage {
  final FlutterDriver _driver;

  HomePage({required FlutterDriver driver}) : _driver = driver;

  Future<String> getCounterValue() => FlutterDriverUtils.getText(
        _driver,
        _findCounter(),
      );

  Future<void> incrementCounter() => FlutterDriverUtils.tap(
        _driver,
        _findIncrementer(),
      );

  Future<void> decrementCounter() => FlutterDriverUtils.tap(
        _driver,
        _findDecrementer(),
      );
}

SerializableFinder _findCounter() => find.byValueKey("counter");
SerializableFinder _findIncrementer() => find.byValueKey("incrementer");
SerializableFinder _findDecrementer() => find.byValueKey("decrementer");
