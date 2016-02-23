var React = require('react'),
    History = require('react-router').History;

var PokemonsIndexItem = React.createClass({
  mixins: [History],

  showDetail: function() {
    this.history.push("/pokemon/" + this.props.pokemon.id);
  },

  render: function() {
    return(
      <li className="poke-list-item" onClick={this.showDetail}>
        Name: {this.props.pokemon.name + " "}
        Type: {this.props.pokemon.poke_type}
      </li>
    );
  }
});

module.exports = PokemonsIndexItem;
