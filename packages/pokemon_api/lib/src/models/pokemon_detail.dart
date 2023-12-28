import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pokemon_detail.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class PokemonDetailResponse {
  const PokemonDetailResponse(this.weight, this.height,
      {required this.sprites, required this.stats});
  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailResponseToJson(this);

  final Sprites sprites;
  final List<Stat> stats;
  final int weight;
  final int height;
}

@JsonSerializable()
class Stat {
  Stat({required this.baseStat});
  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
  @JsonKey(name: 'base_stat')
  final int baseStat;
}

@JsonSerializable()
class StatDetail {
  StatDetail({required this.name});
  factory StatDetail.fromJson(Map<String, dynamic> json) =>
      _$StatDetailFromJson(json);

  Map<String, dynamic> toJson() => _$StatDetailToJson(this);
  final String name;
}

@JsonSerializable()
class Sprites {
  Sprites({required this.frontDefault});
  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
  @JsonKey(name: 'front_default')
  final String frontDefault;
}
