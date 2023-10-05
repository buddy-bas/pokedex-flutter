import 'package:json_annotation/json_annotation.dart';

part 'mocky.g.dart';

@JsonSerializable()
class Mocky {
  const Mocky({required this.name});
  final String name;

  factory Mocky.fromJson(Map<String, dynamic> json) => _$MockyFromJson(json);

  Map<String, dynamic> toJson() => _$MockyToJson(this);
}
