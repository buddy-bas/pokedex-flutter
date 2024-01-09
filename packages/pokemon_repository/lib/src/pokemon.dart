import 'package:pokemon_api/pokemon_api.dart';

class PokemonRepository {
  PokemonRepository({required PokemonApiClient? pokemonApiClient})
      : _pokemonApiClient = pokemonApiClient ?? PokemonApiClient();

  final PokemonApiClient _pokemonApiClient;

  Future<PokemonListResponse> getPokemonList({String? url}) =>
      _pokemonApiClient.pokemonList(url: url);

  Future<PokemonDetailResponse> getPokemonDetail({required String id}) =>
      _pokemonApiClient.pokemonDetail(id: id);

  Future<PokemonSpeciesResponse> getPokemonSpecies({required String name}) =>
      _pokemonApiClient.pokemonSpecies(name: name);

  Future<PokemonEvolutionChainResponse> getPokemonEvolution(
          {required String id}) =>
      _pokemonApiClient.pokemonEvolution(id: id);
}
