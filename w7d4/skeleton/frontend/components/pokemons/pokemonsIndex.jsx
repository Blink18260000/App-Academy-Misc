var PokemonStore = require('../../stores/pokemon'),
    ApiUtil = require('../../util/apiUtil'),
    PokemonIndexItem = require('./pokemonIndexItem'),
    React = require('react');

var PokemonsIndex = React.createClass({
  getInitialState: function() {
    return {pokemons: PokemonStore.all()};
  },

  _onChange: function() {
    this.setState({pokemons: PokemonStore.all()});
  },

  componentDidMount: function (callback) {
    ApiUtil.fetchAllPokemons();
    this.listenerToken = PokemonStore.addListener(this._onChange);
  },

  componentWillUnmount: function () {
    this.listenerToken.remove();
  },

  render: function () {
    return(
      <ul>
        {
          this.state.pokemons.map( function (pokemon) {
            return <PokemonIndexItem pokemon = {pokemon} key= {pokemon.id}/>;
          }, this)
        }
      </ul>
    );
  }
});

module.exports = PokemonsIndex;
