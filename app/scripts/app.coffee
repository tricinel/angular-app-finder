'use strict'

angular.module('angularIosAppsApp', ['ngResource', 'ui.bootstrap'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
