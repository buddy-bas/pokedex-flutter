import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/icons/custom_icons.dart';

void main() {
  test('CustomIcons createInstance returns an instance', () {
    final instance = CustomIcons.createInstance();

    // Assert that the instance is not null
    expect(instance, isNotNull);
  });
}
