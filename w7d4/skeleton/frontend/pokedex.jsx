var React = require('react'),
    ReactDOM = require('react-dom'),
    Router = require('react-router').Router,
    Route = require('react-router').Route,

    PokemonStore = require('./stores/pokemon'),
    ApiUtil = require('./util/apiUtil'),

    App = require('./components/App'),
    PokemonsIndex = require('./components/pokemons/pokemonsIndex'),
    PokemonIndexItem = require('./components/pokemons/pokemonIndexItem'),
    PokemonDetail = require('./components/pokemons/pokemonDetail'),
    ToyDetail = require('./components/toys/toyDetail');


var routes = (
  <Route component={App} path="/">
    <Route component={PokemonDetail} path="pokemon/:pokemonId">
      <Route component={ToyDetail} path="toys/:toyId" />
    </Route>
  </Route>
);


$(document).on('DOMContentLoaded', function() {
  window.ApitUtil = ApiUtil;
  window.PokemonStore = PokemonStore;
  ReactDOM.render((
    <Router>{routes}</Router>
  ), document.getElementById('root'));
});
