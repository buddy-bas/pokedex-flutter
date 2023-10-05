import 'package:flutter/material.dart';
import 'package:pokedex/home/widgets/widgets.dart';
import 'package:pokemon_api/pokemon_api.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const HomeView();
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(100, (int index) => '$index');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokédex",
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(onPressed: () async {
        await PokemonApiClient().pokemonList();
      }),
      body: ListView.separated(
        itemBuilder: (context, index) => const ListItem(),
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 8,
        ),
      ),
    );
  }
}
