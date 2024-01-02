import 'package:flutter/material.dart';
import 'package:pokedex/details/widgets/widgets.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DetailView();
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
          decoration: BoxDecoration(color: Colors.green.shade100),
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(
                children: [
                  const SizedBox(height: 100),
                  const SizedBox(
                    height: 144,
                  ),
                  Stack(
                    children: [
                      const DetailSection(),
                      Transform.translate(
                        offset: const Offset(0, -144),
                        child: Center(
                          child: Image.network(
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
                            width: 200,
                            height: 200,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),
              const Header(title: "title"),
            ],
          )),
    );
  }
}
