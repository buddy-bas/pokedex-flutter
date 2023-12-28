// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetailResponse _$PokemonDetailResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonDetailResponse(
      json['weight'] as int,
      json['height'] as int,
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailResponseToJson(
        PokemonDetailResponse instance) =>
    <String, dynamic>{
      'sprites': instance.sprites.toJson(),
      'stats': instance.stats.map((e) => e.toJson()).toList(),
      'weight': instance.weight,
      'height': instance.height,
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      baseStat: json['base_stat'] as int,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
    };

StatDetail _$StatDetailFromJson(Map<String, dynamic> json) => StatDetail(
      name: json['name'] as String,
    );

Map<String, dynamic> _$StatDetailToJson(StatDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      frontDefault: json['front_default'] as String,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
    };
