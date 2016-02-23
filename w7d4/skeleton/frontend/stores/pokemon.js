var Dispatcher = require('../dispatcher/dispatcher'),
    Store = require('flux/utils').Store,
    PokemonConstants = require('../constants/pokemonConstants');

var _pokemons = {};

var PokemonStore = new Store(Dispatcher);

PokemonStore.__onDispatch = function(payload) {
  switch (payload.actionType) {
    case PokemonConstants.POKEMONS_RECEIVED:
      this.resetPokemons(payload.pokemon);
      this.__emitChange();
      break;
    case PokemonConstants.POKEMON_SINGLE:
      this.updatePokemon(payload.pokemonWithToys);
      this.__emitChange();
      break;
  }
};

PokemonStore.resetPokemons = function(pokemons) {
  for (var i = 0; i < pokemons.length; i++) {
    _pokemons[pokemons[i].id] = pokemons[i];
  }
};

PokemonStore.updatePokemon = function(pokemonWithToys) {
  console.log(pokemonWithToys);
  _pokemons[pokemonWithToys.id] = pokemonWithToys;
};

PokemonStore.all = function () {
  var _returnPokemon = [];
  Object.keys(_pokemons).map(function(key) {
    _returnPokemon.push(_pokemons[key]);
  });
  return _returnPokemon;
};

PokemonStore.find = function (id) {
  return _pokemons[id];
};

module.exports = PokemonStore;
