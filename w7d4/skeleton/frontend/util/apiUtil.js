var PokemonActions = require('../actions/pokemonActions');

var apiUtil = {
  fetchAllPokemons: function() {
    var that = this;
    $.ajax({
     method: 'GET',
     url: 'api/pokemon',
     dataType: 'json',
     success: function(resp) {
        PokemonActions.receiveAllPokemons(resp);
     }
   });
  },
  receiveSinglePokemon: function(id) {
    var that = this;
    $.ajax({
     method: 'GET',
     url: 'api/pokemon/' + id,
     dataType: 'json',
     success: function(resp) {
        PokemonActions.receiveSinglePokemon(resp);
     }
   });
  }
};

module.exports = apiUtil;
