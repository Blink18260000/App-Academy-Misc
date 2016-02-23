var ToysIndexItem = require('./toysIndexItem'),
    React = require('react');

var ToysIndex = React.createClass({
  render: function() {
    if (this.props.toys) {
      return(
        <ul>
          {
            this.props.toys.map(function(toy) {
              return <ToysIndexItem toy={toy} key={toy.name} />;
            } ,this)
          }
        </ul>
      );
    } else {
      return(
        <ul></ul>
      );
    }
  }
});

module.exports = ToysIndex;
