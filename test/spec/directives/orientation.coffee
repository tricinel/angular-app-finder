'use strict'

describe 'Directive: orientation', () ->
  beforeEach module 'angularIosAppsApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<orientation></orientation>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the orientation directive'
