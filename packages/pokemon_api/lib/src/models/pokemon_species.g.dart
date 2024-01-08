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
    );

Map<String, dynamic> _$PokemonSpeciesResponseToJson(
        PokemonSpeciesResponse instance) =>
    <String, dynamic>{
      'flavor_text_entries':
          instance.flavorTextEntries.map((e) => e.toJson()).toList(),
    };

FlavorText _$FlavorTextFromJson(Map<String, dynamic> json) => FlavorText(
      flavorText: json['flavor_text'] as String,
    );

Map<String, dynamic> _$FlavorTextToJson(FlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
    };
