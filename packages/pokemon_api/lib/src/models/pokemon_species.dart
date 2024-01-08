import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pokemon_species.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class PokemonSpeciesResponse {
  const PokemonSpeciesResponse({required this.flavorTextEntries});
  factory PokemonSpeciesResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesResponseToJson(this);

  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorText> flavorTextEntries;
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
