import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_api/pokemon_api.dart';

class PokemonApiClient {
  final Dio _httpClient = ApiClient().dio();

  Future<PokemonListResponse> pokemonList({int limit = 10, String? url}) async {
    final pokemonResponse = await _httpClient
        .get(url ?? 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=0');

    if (pokemonResponse.statusCode != 200) {
      throw Error();
    }
    print(pokemonResponse.data);
    return PokemonListResponse.fromJson(pokemonResponse.data);
  }
}
