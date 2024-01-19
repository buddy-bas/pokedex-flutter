import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokemon_api/pokemon_api.dart';

class MockHttpClient extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('PokemonApiClient', () {
    late PokemonApiClient pokemonApiClient;
    late Dio dio;
    late Response successResponse;
    late Response errResponse;
    setUp(() {
      dio = MockHttpClient();
      pokemonApiClient = PokemonApiClient(httpClient: dio);
    });
    setUpAll(() {
      successResponse = Response(
          data: {'result': 'Mocked Data'},
          statusCode: 200,
          requestOptions: RequestOptions());
      errResponse = Response(
          data: null, statusCode: 404, requestOptions: RequestOptions());
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(PokemonApiClient(), isNotNull);
      });
    });

    group('pokemonList', () {
      test('makes correct http request', () async {
        // Mock the Dio response
        when(() => dio.get(any())).thenAnswer(
          (_) async => successResponse,
        );
        try {
          await pokemonApiClient.pokemonList();
        } catch (_) {}
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/pokemon?limit=30&offset=0',
          ),
        ).called(1);
      });

      test('handles non-200 response', () async {
        // Mock the Dio response
        when(() => dio.get(any())).thenAnswer((_) async => errResponse);
        expect(() async => await pokemonApiClient.pokemonList(),
            throwsA(isA<Error>()));
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/pokemon?limit=30&offset=0',
          ),
        ).called(1);
      });
    });

    group('pokemonDetail', () {
      const id = '1';
      test('makes correct http request', () async {
        // Mock the Dio response

        when(() => dio.get(any())).thenAnswer(
          (_) async => successResponse,
        );
        try {
          await pokemonApiClient.pokemonDetail(id: id);
        } catch (_) {}
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/pokemon/$id',
          ),
        ).called(1);
      });

      test('handles non-200 response', () async {
        // Mock the Dio response
        when(() => dio.get(any())).thenAnswer((_) async => errResponse);
        expect(() async => await pokemonApiClient.pokemonDetail(id: id),
            throwsA(isA<Error>()));
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/pokemon/$id',
          ),
        ).called(1);
      });
    });

    group('pokemonSpecies', () {
      const name = 'name';
      test('makes correct http request', () async {
        // Mock the Dio response

        when(() => dio.get(any())).thenAnswer(
          (_) async => successResponse,
        );
        try {
          await pokemonApiClient.pokemonSpecies(name: name);
        } catch (_) {}
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/pokemon-species/$name',
          ),
        ).called(1);
      });

      test('handles non-200 response', () async {
        // Mock the Dio response
        when(() => dio.get(any())).thenAnswer((_) async => errResponse);
        expect(() async => await pokemonApiClient.pokemonSpecies(name: name),
            throwsA(isA<Error>()));
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/pokemon-species/$name',
          ),
        ).called(1);
      });
    });

    group('pokemonEvolution', () {
      const id = '1';
      test('makes correct http request', () async {
        // Mock the Dio response

        when(() => dio.get(any())).thenAnswer(
          (_) async => successResponse,
        );
        try {
          await pokemonApiClient.pokemonEvolution(id: id);
        } catch (_) {}
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/evolution-chain/$id',
          ),
        ).called(1);
      });

      test('handles non-200 response', () async {
        // Mock the Dio response
        when(() => dio.get(any())).thenAnswer((_) async => errResponse);
        expect(() async => await pokemonApiClient.pokemonEvolution(id: id),
            throwsA(isA<Error>()));
        verify(
          () => dio.get(
            'https://pokeapi.co/api/v2/evolution-chain/$id',
          ),
        ).called(1);
      });
    });
  });
}
