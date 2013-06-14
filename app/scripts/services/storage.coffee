'use strict';

angular.module('ngAppFinder')
  .factory 'storage', ($cookieStore) ->

    cookie = 'savedSearches'

    exists = (id,searches) ->
      result = false
      result = true for app in searches when app.id is id
      return result


    # Public API here
    {
      get: () ->
        return $cookieStore.get(cookie) || []

      put: (id,name) ->
        newSearch =
          id: id
          name: name
        searches = this.get()
        if not exists(id,searches)
          searches.push newSearch
          $cookieStore.put cookie, searches
        return

      delete: () ->
        $cookieStore.remove cookie
        return
    }
