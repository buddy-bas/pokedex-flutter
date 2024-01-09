import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pokemon_detail.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class PokemonDetailResponse {
  const PokemonDetailResponse(
      {required this.weight,
      required this.name,
      // required this.url,
      required this.height,
      required this.types,
      required this.species,
      required this.abilities,
      required this.stats});
  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailResponseToJson(this);

  final List<Stat> stats;
  final int weight;
  final int height;
  final List<ElementType> types;
  final Species species;
  final List<Ability> abilities;
  final String name;
  // final String url;
}

@JsonSerializable()
class Ability {
  const Ability({required this.ability});
  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);

  final AbilityDetail ability;
}

@JsonSerializable()
class AbilityDetail {
  const AbilityDetail({required this.name, required this.url});
  factory AbilityDetail.fromJson(Map<String, dynamic> json) =>
      _$AbilityDetailFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityDetailToJson(this);

  final String name;
  final String url;
}

@JsonSerializable()
class Species {
  const Species({required this.url, required this.name});
  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesToJson(this);

  final String url;
  final String name;
}

@JsonSerializable()
class ElementType {
  const ElementType({required this.type});

  factory ElementType.fromJson(Map<String, dynamic> json) =>
      _$ElementTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ElementTypeToJson(this);

  final ElementTypeDetail type;
}

@JsonSerializable()
class ElementTypeDetail {
  const ElementTypeDetail({required this.name, required this.url});

  factory ElementTypeDetail.fromJson(Map<String, dynamic> json) =>
      _$ElementTypeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ElementTypeDetailToJson(this);

  final String name;
  final String url;
}

@JsonSerializable()
class Stat {
  const Stat(this.stat, {required this.baseStat});
  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
  @JsonKey(name: 'base_stat')
  final int baseStat;
  final StatDetail stat;
}

@JsonSerializable()
class StatDetail {
  const StatDetail({required this.name});
  factory StatDetail.fromJson(Map<String, dynamic> json) =>
      _$StatDetailFromJson(json);

  Map<String, dynamic> toJson() => _$StatDetailToJson(this);
  final String name;
}
