'use strict'

angular.module('angularIosAppsApp')
  .controller 'MainCtrl', ['$scope', 'itunes', 'storage', ($scope, itunes, storage) ->

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

    getSavedSearches = () ->
      $scope.savedSearches = storage.get()
      return

    addAlert = (type, msg) ->
      $scope.alerts = $scope.alerts || []
      $scope.alerts.push
        type: type
        msg: msg
      return

    clearAlerts = () ->
      $scope.alerts = null

    getSavedSearches()

    $scope.clearSearch = () ->
      storage.delete()
      getSavedSearches()
      return

    $scope.search = (id) ->
      appId = id || $scope.appId

      itunes.get {id:appId}, (res) ->
        if res.resultCount
          #remove any existing alerts
          clearAlerts()
          #set up the app
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

          #save to $cookies
          storage.put appId, $scope.app.trackName

        else
          addAlert 'error', 'App doesn\'t exist'

        $scope.appId = ''
        getSavedSearches()

  ]