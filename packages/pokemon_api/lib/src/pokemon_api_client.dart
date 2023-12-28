import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon_api/pokemon_api.dart';

class PokemonApiClient {
  final Dio _httpClient = ApiClient().dio();

  Future<PokemonListResponse> pokemonList({int limit = 30, String? url}) async {
    final res = await _httpClient
        .get(url ?? 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=0');

    if (res.statusCode != 200) {
      throw Error();
    }
    return PokemonListResponse.fromJson(res.data);
  }

  Future<PokemonDetailResponse> pokemonDetail({required String url}) async {
    final res = await _httpClient.get(url);

    if (res.statusCode != 200) {
      throw Error();
    }
    debugPrint(res.data);
    return PokemonDetailResponse.fromJson(res.data);
  }
}
