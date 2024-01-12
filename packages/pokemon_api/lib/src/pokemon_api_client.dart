import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:pokemon_api/src/models/pokemon_evolution_chain.dart';

class PokemonApiClient {
  final Dio _httpClient = ApiClient().dio();

  Future<PokemonListResponse> pokemonList({int limit = 30, String? url}) async {
    final res = await _httpClient.get(
        url ?? 'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=149');

    if (res.statusCode != 200) {
      throw Error();
    }
    return PokemonListResponse.fromJson(res.data);
  }

  Future<PokemonDetailResponse> pokemonDetail({required String id}) async {
    final res = await _httpClient.get('https://pokeapi.co/api/v2/pokemon/$id');

    if (res.statusCode != 200) {
      throw Error();
    }
    return PokemonDetailResponse.fromJson(res.data);
  }

  Future<PokemonSpeciesResponse> pokemonSpecies({required String name}) async {
    final res = await _httpClient
        .get('https://pokeapi.co/api/v2/pokemon-species/$name');

    if (res.statusCode != 200) {
      throw Error();
    }
    return PokemonSpeciesResponse.fromJson(res.data);
  }

  Future<PokemonEvolutionChainResponse> pokemonEvolution(
      {required String id}) async {
    final res =
        await _httpClient.get('https://pokeapi.co/api/v2/evolution-chain/$id');

    if (res.statusCode != 200) {
      throw Error();
    }
    return PokemonEvolutionChainResponse.fromJson(res.data);
  }
}
