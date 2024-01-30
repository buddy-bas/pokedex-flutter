import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_species.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonSpeciesResponse extends Equatable {
  const PokemonSpeciesResponse(
      {required this.flavorTextEntries, required this.evolutionChain});
  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesResponseToJson(this);

  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorText> flavorTextEntries;
  @JsonKey(name: 'evolution_chain')
  final EvolutionChain evolutionChain;

  @override
  List<Object?> get props => [flavorTextEntries, evolutionChain];
}

@JsonSerializable()
class EvolutionChain extends Equatable {
  const EvolutionChain({required this.url});

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);

  final String url;

  @override
  List<Object?> get props => [url];
}

@JsonSerializable()
class FlavorText extends Equatable {
  const FlavorText({required this.flavorText});

  factory FlavorText.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);

  @JsonKey(name: 'flavor_text')
  final String flavorText;

  @override
  List<Object?> get props => [flavorText];
}
