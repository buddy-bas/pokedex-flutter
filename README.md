<h1 align="center">Pokedex</h1>
<p align="center">
<a href="https://github.com/buddy-bas/pokedex-flutter/actions"><img src="https://github.com/buddy-bas/pokedex-flutter/workflows/Flutter CI/badge.svg" alt="Build Status"></a>
<a href="https://github.com/felangel/bloc"><img src="https://tinyurl.com/bloc-library" alt="Bloc Library"></a>
</p>
<p align="center">  
 🚀 Pokedex demonstrates Flutter development based on Bloc architecture.
</p>

## Architecture
Based on the Bloc state management and the Repository pattern, which follows the [Bloc state manager document](https://bloclibrary.dev/#/).

<img src="https://bloclibrary.dev/assets/bloc_architecture_full.png" width="60%"/>

The overall architecture of **Pokedex** is separate into [three layers](https://bloclibrary.dev/#/architecture?id=presentation-layer).

### Data Layer
- The data provider's responsibility is to provide raw data. The data provider should be generic and versatile.

### Business Logic Layer
- The business logic layer's responsibility is to respond to input from the presentation layer with new states. This layer can depend on one or more repositories to retrieve data needed to build up the application state.

### Presentation Layer
- The presentation layer's responsibility is to figure out how to render itself based on one or more bloc states. In addition, it should handle user input and application lifecycle events.

## API
<img src="https://user-images.githubusercontent.com/24237865/83422649-d1b1d980-a464-11ea-8c91-a24fdf89cd6b.png" width="21%"/>

Pokedex using the [PokeAPI](https://pokeapi.co/) for constructing RESTful API.<br>
