var _todos = [],
    _callbacks = [];

var TodoStore = {
  changed: function() {
    _callbacks.forEach(function(cb) {
      cb();
    });
  },

  addChangedHandler: function(cb) {
    _callbacks.push(cb);
  },

  removeChangedHandler: function(cb) {
    var idx = _callbacks.indexOf(cb);

    if(idx >= 0) {
      _callbacks.splice(idx, 1);
    }
  },

  all: function() {
    return _todos.slice();
  },

  fetch: function() {
    $.get('api/todos', {}, function(todos){
      _todos = todos;
      TodoStore.changed();
    });
  },

  create: function(todo) {
    $.post('api/todos', {todo: todo}, function(todo) {
      _todos.push(todo);
      TodoStore.changed();
    });
  },

  destroy: function(id) {
    var idx = -1;

    for (var i = 0; i < _todos.length; i++) {
      if (_todos[i].id === id) {
        idx = i;
      }
    }

    if (idx >= 0) {
      $.ajax({
        url: 'api/todos/' + id,
        type: 'DELETE',
        success: function() {
          _todos.splice(idx, 1);
          TodoStore.changed();
        }
      });
    }
  },

  toggleDone: function(id) {
    var idx = -1;

    for (var i = 0; i < _todos.length; i++) {
      if (_todos[i].id === id) {
        idx = i;
      }
    }

    if (idx >= 0) {
      var todo = _todos[idx];
      TodoStore._toggleDone(todo);
      $.ajax({
        url: 'api/todos/' + id,
        type: 'PATCH',
        data: {todo: todo},
        success: function() { TodoStore.changed(); },
        error: function() { TodoStore._toggleDone(todo); }
      });
    }
  },

  _toggleDone: function(todo){
    if (todo.done) {
      todo.done = false;
    } else {
      todo.done = true;
    }
  }
};

module.exports = TodoStore;
