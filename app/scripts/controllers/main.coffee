'use strict'

angular.module('angularIosAppsApp')
  .controller 'MainCtrl', ['$scope', 'itunes', ($scope, itunes) ->

    $scope.search = () ->
      $scope.alert = false
      $scope.app = false

      itunes.get {id:$scope.appId}, (res) ->
        if res.resultCount
          $scope.app = res.results[0]
        else
          $scope.alert =
            type: 'error'
            message: 'App doesn\'t exist'

  ]