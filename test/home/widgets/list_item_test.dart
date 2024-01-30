import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/home/widgets/widgets.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('test name', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(const MaterialApp(
        home: ListItem(name: 'bulbasaur', id: '1'),
      ));
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), isNotNull);
    });
  });
}
