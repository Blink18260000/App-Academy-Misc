var React = require('react'),
    ReactDOM = require('react-dom'),
    TodoListItem = require('./todo_list_item'),
    TodoStore = require('../stores/todo_store'),
    TodoForm = require('./todo_form');

var TodoList = React.createClass({
  getInitialState: function() {
    return ( {
      list: TodoStore.all()
    });
  },
  componentDidMount: function() {
    TodoStore.fetch();
    TodoStore.addChangedHandler(this.updateList);
  },
  updateList: function() {
    this.setState({list: TodoStore.all()});
  },
  componentWillUnmount: function() {
    TodoStore.removeChangedHandler(this.updateList);
  },
  render: function() {
    return (
      <div>
          {this.state.list.map(function(todo) {
            return (<TodoListItem todoItem={todo} key={todo.id} />);
          }, this)}
          <TodoForm/>
      </div>
    );
  }
});

module.exports = TodoList;
