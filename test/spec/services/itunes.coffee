'use strict'

describe 'Service: itunes', () ->

  # load the service's module
  beforeEach module 'angularIosAppsApp'

  # instantiate service
  itunes = {}
  beforeEach inject (_itunes_) ->
    itunes = _itunes_

  it 'should do something', () ->
    expect(!!itunes).toBe true;
