// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_evolution_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonEvolutionChainResponse _$PokemonEvolutionChainResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonEvolutionChainResponse(
      chain: Chain.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonEvolutionChainResponseToJson(
        PokemonEvolutionChainResponse instance) =>
    <String, dynamic>{
      'chain': instance.chain.toJson(),
    };

Chain _$ChainFromJson(Map<String, dynamic> json) => Chain(
      species: Species.fromJson(json['species'] as Map<String, dynamic>),
      evolvesTo: (json['evolves_to'] as List<dynamic>)
          .map((e) => Chain.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChainToJson(Chain instance) => <String, dynamic>{
      'species': instance.species.toJson(),
      'evolves_to': instance.evolvesTo.map((e) => e.toJson()).toList(),
    };
