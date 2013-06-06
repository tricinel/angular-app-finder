'use strict'

angular.module('angularIosAppsApp')
  .controller 'MainCtrl', ['$scope', 'itunes', ($scope, itunes) ->

    $scope.search = () ->
      $scope.alert = false
      $scope.app = false
      keys = [
        'artworkUrl512'
        'trackName'
        'trackViewUrl'
        'formattedPrice'
        'primaryGenreName'
        'version'
        'artistName'
        'sellerUrl'
        'screenshotUrls'
        'ipadScreenshotUrls'
      ]

      itunes.get {id:$scope.appId}, (res) ->
        if res.resultCount
          $scope.app = {}
          $scope.app[key] = value for key, value of res.results[0] when key in keys
          #set up the tab panes and images
          $scope.app.imagesPanes = []
          if $scope.app.screenshotUrls.length
            #set up the iPhone pane
            $scope.app.imagesPanes.push
              title: 'iPhone'
              screenshots: $scope.app.screenshotUrls
          if $scope.app.ipadScreenshotUrls.length
            #set up the iPad pane
            $scope.app.imagesPanes.push
              title: 'iPad'
              screenshots: $scope.app.ipadScreenshotUrls

          $scope.app.imagesPanes[0].active = true

        else
          $scope.alert =
            type: 'error'
            message: 'App doesn\'t exist'

  ]