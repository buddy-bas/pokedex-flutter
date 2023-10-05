// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) =>
    PokemonListResponse(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => PokemonResponseResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      previous: json['previous'] as String?,
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PokemonListResponseToJson(
        PokemonListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results.map((e) => e.toJson()).toList(),
      'next': instance.next,
      'previous': instance.previous,
    };

PokemonResponseResult _$PokemonResponseResultFromJson(
        Map<String, dynamic> json) =>
    PokemonResponseResult(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonResponseResultToJson(
        PokemonResponseResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
