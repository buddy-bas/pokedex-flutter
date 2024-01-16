import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

typedef EvolutionChain = List<List<Species>>;

class PokemonDetail extends Equatable {
  const PokemonDetail(
      {required this.stats,
      required this.weight,
      required this.height,
      required this.name,
      required this.types,
      required this.evolutionChain,
      required this.primaryColor,
      required this.flavorText,
      required this.abilities});

  @override
  List<Object?> get props => [stats, weight, height, name, types, abilities];
  final List<Stat> stats;
  final String weight;
  final String height;
  final String name;
  final List<ElementType> types;
  final String flavorText;
  final List<Ability> abilities;
  final Color primaryColor;
  final EvolutionChain evolutionChain;
}

class Species extends Equatable {
  const Species({required this.name, required this.id});

  @override
  List<Object?> get props => [id, name];
  final String name;
  final String id;
}

class Chain extends Equatable {
  const Chain({required this.name, required this.id, required this.evolveTo});

  @override
  List<Object?> get props => [name, id, evolveTo];
  final String name;
  final String id;
  final List<Chain> evolveTo;
}

class Ability extends Equatable {
  const Ability({required this.name});
  final String name;

  @override
  List<Object?> get props => [name];
}

class ElementType extends Equatable {
  const ElementType({required this.name, required this.color});
  final String name;
  final Color color;

  @override
  List<Object?> get props => [name, color];
}

class Stat extends Equatable {
  const Stat({required this.label, required this.value});
  final String label;
  final double value;

  @override
  List<Object?> get props => [label, value];
}
