var React = require('react'),
    History = require('react-router').History;

var ToysIndexItem = React.createClass({
  mixins: [History],

  showDetail: function() {
    this.history.push("/pokemon/" + this.props.toy.pokemon_id +
                      "/toys/" + this.props.toy.id);
  },

  render: function() {
    return(
      <li onClick={this.showDetail} key={this.props.toy.name}>
        <img src={this.props.toy.image_url} />
      </li>
    );
  }
});

module.exports = ToysIndexItem;
