'use strict';

angular.module('angularIosAppsApp')
  .factory 'storage', ($cookieStore) ->

    cookie = 'savedSearches'

    exists = (id,searches) ->
      result = false
      for app in searches
        result = true for key,value of app when key is id
      return result


    # Public API here
    {
      get: () ->
        return $cookieStore.get(cookie) || []

      put: (id,name) ->
        newSearch = {}
        newSearch[id] = name
        searches = this.get()
        console.log exists(id,searches)
        if not exists(id,searches)
          searches.push newSearch
          $cookieStore.put cookie, searches
        return

      delete: () ->
        $cookieStore.remove cookie
        return
    }
