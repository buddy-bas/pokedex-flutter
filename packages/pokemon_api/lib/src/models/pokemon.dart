import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'pokemon.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class PokemonListResponse {
  const PokemonListResponse({
    required this.count,
    required this.results,
    this.previous,
    this.next,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);

  final int count;
  final List<PokemonResponseResult> results;
  final String? next;
  final String? previous;
}

@JsonSerializable()
class PokemonResponseResult {
  PokemonResponseResult({required this.name, required this.url});

  factory PokemonResponseResult.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseResultFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseResultToJson(this);

  final String name;
  final String url;
}
