import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:pokemon_api/pokemon_api.dart';

part 'pokemon_evolution_chain.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class PokemonEvolutionChainResponse {
  const PokemonEvolutionChainResponse({required this.chain});
  factory PokemonEvolutionChainResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonEvolutionChainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonEvolutionChainResponseToJson(this);

  final Chain chain;
}

@JsonSerializable()
class Chain {
  Chain({
    required this.species,
    required this.evolvesTo,
  });

  factory Chain.fromJson(Map<String, dynamic> json) => _$ChainFromJson(json);

  Map<String, dynamic> toJson() => _$ChainToJson(this);
  final Species species;

  @JsonKey(name: 'evolves_to')
  final List<Chain> evolvesTo;
}
