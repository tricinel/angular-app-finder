'use strict';

angular.module('angularIosAppsApp')
  .directive('orientation', () ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      element.bind 'load', () ->
        w = element[0].clientWidth
        h = element[0].clientHeight

        element.addClass if w > h then 'img-landscape' else 'img-portrait'
  )