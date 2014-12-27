# For more information see: http://emberjs.com/guides/routing/

DeckBuilder.Router.reopen
  location: "none"
  rootURL: "/deck_builder/"

DeckBuilder.Router.map ->
  @resource "cards", path: "/"

