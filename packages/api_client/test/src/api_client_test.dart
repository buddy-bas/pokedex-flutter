import 'package:api_client/api_client.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements DioForNative {}

void main() {
  group("description", () {
    late ApiClient client;
    setUpAll(() {
      client = ApiClient();
    });

    test('dio() method returns a Dio instance with the correct options', () {
      expect(client.dio(), isA<DioForNative>());
    });
  });
}
