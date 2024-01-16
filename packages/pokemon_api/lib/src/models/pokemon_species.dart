import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pokemon_species.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class PokemonSpeciesResponse {
  const PokemonSpeciesResponse(
      {required this.flavorTextEntries, required this.evolutionChain});
  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesResponseToJson(this);

  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorText> flavorTextEntries;
  @JsonKey(name: 'evolution_chain')
  final EvolutionChain evolutionChain;
}

@JsonSerializable()
class EvolutionChain {
  EvolutionChain({required this.url});

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);

  final String url;
}

@JsonSerializable()
class FlavorText {
  FlavorText({required this.flavorText});

  factory FlavorText.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);

  @JsonKey(name: 'flavor_text')
  final String flavorText;
}
