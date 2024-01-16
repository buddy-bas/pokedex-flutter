import 'package:flutter/widgets.dart';

class StaticData {
  static final Map<String, Color> elementColors = {
    '1': const Color(0xFFAAA67F), //normal
    '2': const Color(0xFFC12239), //fighting
    '3': const Color(0xFFA891EC), //flying
    '4': const Color(0xFFA43E9E), //poison
    '5': const Color(0xFFDEC16B), //ground
    '6': const Color(0xFFB69E31), //rock
    '7': const Color(0xFFA7B723), //bug
    '8': const Color(0xFF70559B), //ghost
    '9': const Color(0xFFB7B9D0), //steel
    '10': const Color(0xFFF57D31), //fire
    '11': const Color(0xFF6493EB), //water
    '12': const Color(0xFF74CB48), //grass
    '13': const Color(0xFFF9CF30), //electric
    '14': const Color(0xFFFB5584), //psychic
    '15': const Color(0xFF9AD6DF), //ice
    '16': const Color(0xFF6F35FC), //dragon
    '17': const Color(0xFF75574C), //dark
    '18': const Color(0xFFE69EAC), //fairy
  };

  static String pokemonImageUrl(String id) =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
}
