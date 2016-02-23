var React = require('react'),
    PokemonStore = require('../../stores/pokemon'),
    ApiUtil = require('../../util/apiUtil');

var ToyDetail = React.createClass({
  getInitialState: function () {
    var pokemonId = parseInt(this.props.params.pokemonId);
    var toyId = parseInt(this.props.params.toyId);
    return { toy: (this.getStateFromStore(pokemonId, toyId)) };
  },

  _onChange: function() {
    var pokemonId = parseInt(this.props.params.pokemonId);
    var toyId = parseInt(this.props.params.toyId);
    this.setState({ toy: (this.getStateFromStore(pokemonId, toyId)) });
  },

  componentDidMount: function () {
    this.listenerToken = PokemonStore.addListener(this._onChange);
  },

  componentWillUnmount: function () {
    this.listenerToken.remove();
  },

  componentWillReceiveProps: function (props) {
    var pokemonId = parseInt(props.params.pokemonId);
    var toyId = parseInt(props.params.toyId);
  },

  render: function () {
    if (this.state.toy) {
      return (
        <div>
          <div className='toy-detail-pane'>
            <div className='detail'>
              <div>Name: {this.state.toy.name + "\n"}</div>
              <div>Happiness: {this.state.toy.happiness + "\n"}</div>
              <div>Price: {this.state.toy.price + "\n"}</div>
            </div>
          </div>
        </div>
      );
    } else {
      return (
        <div>
          <div className='toy-detail-pane'>
            <div className='detail'>
            </div>
          </div>
        </div>
      );
    }
  },

  getStateFromStore: function (pokemonId, toyId) {
    var pokemon = PokemonStore.find(pokemonId);
    var toy = undefined;
    if (!pokemon.toys) {
      console.log("toy detail update");
      ApiUtil.receiveSinglePokemon(pokemonId);
      return undefined;
    }
    for (var i  = 0; i < pokemon.toys.length; i++) {
      if (pokemon.toys[i].id === toyId) {
        toy = pokemon.toys[i];
        break;
      }
    }
    return toy;
  }
});

module.exports = ToyDetail;
