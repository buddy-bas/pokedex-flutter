import 'package:pokemon_api/pokemon_api.dart';

class PokemonRepository {
  PokemonRepository({required PokemonApiClient? pokemonApiClient})
      : _pokemonApiClient = pokemonApiClient ?? PokemonApiClient();

  final PokemonApiClient _pokemonApiClient;
  Future<PokemonListResponse> getPokemonList({String? url}) =>
      _pokemonApiClient.pokemonList(url: url);

  Future<PokemonDetailResponse> getPokemonDetail({required String url}) =>
      _pokemonApiClient.pokemonDetail(url: url);
}
