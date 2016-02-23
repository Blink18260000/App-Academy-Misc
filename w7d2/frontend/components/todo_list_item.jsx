var React = require('react'),
    ReactDOM = require('react-dom');

var TodoListItem = React.createClass({
  getInitialState: function() {
    return ({
      todoItem: this.props.todoItem
    });
  },
  render: function() {
    return (
      <div>
        <div className="title">{this.state.todoItem.title}</div>
        <div className="body">{this.state.todoItem.body}</div>
      </div>
    );
  }
});

module.exports = TodoListItem;
