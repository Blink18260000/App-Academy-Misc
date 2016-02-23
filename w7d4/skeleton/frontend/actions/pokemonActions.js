var Dispatcher = require('../dispatcher/dispatcher'),
    PokemonConstants = require('../constants/pokemonConstants');

var pokemonActions = {
  receiveAllPokemons: function(pokemonArr) {
    Dispatcher.dispatch ({
      actionType: PokemonConstants.POKEMONS_RECEIVED,
      pokemon: pokemonArr
    });
  },
  receiveSinglePokemon: function(pokemonWithToys) {
    Dispatcher.dispatch ({
      actionType: PokemonConstants.POKEMON_SINGLE,
      pokemonWithToys: pokemonWithToys
    });
  }
};

module.exports = pokemonActions;
