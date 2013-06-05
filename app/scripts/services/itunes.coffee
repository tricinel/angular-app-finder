'use strict';

angular.module('angularIosAppsApp')
  .factory 'itunes', ['$resource', ($resource) ->

    return $resource 'https://itunes.apple.com/:action',
      {
        action:'lookup'
        callback: 'JSON_CALLBACK'
      }
      {
        get:
          method: 'JSONP'
          params:
            id: '@id'
      }

  ]