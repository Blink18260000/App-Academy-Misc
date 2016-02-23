var React = require('react'),
    PokemonStore = require('../../stores/pokemon'),
    ApiUtil = require('../../util/apiUtil'),
    ToysIndex = require('../toys/toysIndex');

var PokemonDetail = React.createClass({
  getInitialState: function () {
    var pokemonId = parseInt(this.props.params.pokemonId);
    return { pokemon: (this.getStateFromStore(pokemonId)) };
  },

  _onChange: function() {
    var pokemonId = parseInt(this.props.params.pokemonId);
    this.setState({pokemon: (this.getStateFromStore(pokemonId))});
  },

  componentDidMount: function () {
    ApiUtil.receiveSinglePokemon(parseInt(this.props.params.pokemonId));
    this.listenerToken = PokemonStore.addListener(this._onChange);
  },

  componentWillUnmount: function () {
    this.listenerToken.remove();
  },

  componentWillReceiveProps: function (props) {
    var pokemonId = parseInt(props.params.pokemonId);
    ApiUtil.receiveSinglePokemon(pokemonId);
  },

  render: function () {
    if (this.state.pokemon) {
      return (
        <div>
          <div className='pokemon-detail-pane'>
            <div className='detail'>
              <div>Name: {this.state.pokemon.name + "\n"}</div>
              <div>Id: {this.state.pokemon.id + "\n"}</div>
              <div>Type: {this.state.pokemon.poke_type + "\n"}</div>
              <div>Attack: {this.state.pokemon.attack + "\n"}</div>
              <div>Defense: {this.state.pokemon.defense + "\n"}</div>
              <div>Moves: {this.state.pokemon.moves + "\n"}</div>
              <img src={this.state.pokemon.image_url} />
              <ToysIndex toys={this.state.pokemon.toys}/>
            </div>
          </div>
          {this.props.children}
        </div>
      );
    } else {
      return (
        <div>
          <div className='pokemon-detail-pane'>
            <div className='detail'>
            </div>
          </div>
        </div>
      );
    }
  },

  getStateFromStore: function (id) {
    return PokemonStore.find(id);
  }
});

module.exports = PokemonDetail;
