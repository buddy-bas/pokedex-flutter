// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailResponse _$PokemonDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailResponse(
      weight: json['weight'] as int,
      name: json['name'] as String,
      height: json['height'] as int,
      types: (json['types'] as List<dynamic>)
          .map((e) => ElementType.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: Species.fromJson(json['species'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Ability.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailResponseToJson(
        PokemonDetailResponse instance) =>
    <String, dynamic>{
      'stats': instance.stats.map((e) => e.toJson()).toList(),
      'weight': instance.weight,
      'height': instance.height,
      'types': instance.types.map((e) => e.toJson()).toList(),
      'species': instance.species.toJson(),
      'abilities': instance.abilities.map((e) => e.toJson()).toList(),
      'name': instance.name,
    };

Ability _$AbilityFromJson(Map<String, dynamic> json) => Ability(
      ability: AbilityDetail.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'ability': instance.ability.toJson(),
    };

AbilityDetail _$AbilityDetailFromJson(Map<String, dynamic> json) =>
    AbilityDetail(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AbilityDetailToJson(AbilityDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      url: json['url'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
    };

ElementType _$ElementTypeFromJson(Map<String, dynamic> json) => ElementType(
      type: ElementTypeDetail.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ElementTypeToJson(ElementType instance) =>
    <String, dynamic>{
      'type': instance.type.toJson(),
    };

ElementTypeDetail _$ElementTypeDetailFromJson(Map<String, dynamic> json) =>
    ElementTypeDetail(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ElementTypeDetailToJson(ElementTypeDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      baseStat: json['base_stat'] as int,
      stat: StatDetail.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat.toJson(),
    };

StatDetail _$StatDetailFromJson(Map<String, dynamic> json) => StatDetail(
      name: json['name'] as String,
    );

Map<String, dynamic> _$StatDetailToJson(StatDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
