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
  final List<PokemonResultResponse> results;
  final String? next;
  final String? previous;
}

@JsonSerializable()
class PokemonResultResponse {
  const PokemonResultResponse({required this.name, required this.url});

  factory PokemonResultResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResultResponseToJson(this);

  final String name;
  final String url;
}
