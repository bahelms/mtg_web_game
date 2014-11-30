#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require deck_builder

# for more details see: http://emberjs.com/guides/application/
window.DeckBuilder = Ember.Application.create
  rootElement: "#deck_builder_ember_container"
  Resolver: Ember.DefaultResolver.extend
    resolveTemplate: (parsedName) ->
      fullName = parsedName.fullNameWithoutType
      parsedName.fullNameWithoutType = "deck_builder/#{fullName}"
      @_super(parsedName)

