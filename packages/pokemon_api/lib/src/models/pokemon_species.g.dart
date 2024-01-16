// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpeciesResponse _$PokemonSpeciesResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonSpeciesResponse(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionChain: EvolutionChain.fromJson(
          json['evolution_chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpeciesResponseToJson(
        PokemonSpeciesResponse instance) =>
    <String, dynamic>{
      'flavor_text_entries':
          instance.flavorTextEntries.map((e) => e.toJson()).toList(),
      'evolution_chain': instance.evolutionChain.toJson(),
    };

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      url: json['url'] as String,
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

FlavorText _$FlavorTextFromJson(Map<String, dynamic> json) => FlavorText(
      flavorText: json['flavor_text'] as String,
    );

Map<String, dynamic> _$FlavorTextToJson(FlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
    };
