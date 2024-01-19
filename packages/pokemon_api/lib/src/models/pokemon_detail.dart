import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonDetailResponse extends Equatable {
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

  @override
  List<Object?> get props =>
      [stats, weight, height, types, species, abilities, name];
}

@JsonSerializable(explicitToJson: true)
class Ability extends Equatable {
  const Ability({required this.ability});
  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);

  final AbilityDetail ability;

  @override
  List<Object?> get props => [ability];
}

@JsonSerializable()
class AbilityDetail extends Equatable {
  const AbilityDetail({required this.name, required this.url});
  factory AbilityDetail.fromJson(Map<String, dynamic> json) =>
      _$AbilityDetailFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityDetailToJson(this);

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}

@JsonSerializable()
class Species extends Equatable {
  const Species({required this.url, required this.name});
  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);
  Map<String, dynamic> toJson() => _$SpeciesToJson(this);

  final String url;
  final String name;

  @override
  List<Object?> get props => [name, url];
}

@JsonSerializable(explicitToJson: true)
class ElementType extends Equatable {
  const ElementType({required this.type});

  factory ElementType.fromJson(Map<String, dynamic> json) =>
      _$ElementTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ElementTypeToJson(this);

  final ElementTypeDetail type;

  @override
  List<Object?> get props => [type];
}

@JsonSerializable()
class ElementTypeDetail extends Equatable {
  const ElementTypeDetail({required this.name, required this.url});

  factory ElementTypeDetail.fromJson(Map<String, dynamic> json) =>
      _$ElementTypeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ElementTypeDetailToJson(this);

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];
}

@JsonSerializable(explicitToJson: true)
class Stat extends Equatable {
  const Stat({
    required this.baseStat,
    required this.stat,
  });
  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
  @JsonKey(name: 'base_stat')
  final int baseStat;
  final StatDetail stat;

  @override
  List<Object?> get props => [baseStat, stat];
}

@JsonSerializable()
class StatDetail extends Equatable {
  const StatDetail({required this.name});
  factory StatDetail.fromJson(Map<String, dynamic> json) =>
      _$StatDetailFromJson(json);

  Map<String, dynamic> toJson() => _$StatDetailToJson(this);
  final String name;

  @override
  List<Object?> get props => [name];
}
