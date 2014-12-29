Ember.Handlebars.helper "manaCostImages", (manaCost) ->
  image_html = (url_color) ->
    "<img src='http://mtgimage.com/actual/symbol/mana/#{url_color}/16.png'>"

  format_color_code = (color) ->
    switch color
      when "black" then "b"
      when "blue" then "u"
      when "green" then "g"
      when "red" then "r"
      when "white" then "w"
      when "colorless" then "colorless"

  manaCostHtml = ""
  for cost in manaCost.split ","
    color = cost.split("=>")[0]
    amount = cost.split("=>")[1] || 0
    url_color = format_color_code color

    if url_color is "colorless" || amount is 0
      manaCostHtml += image_html amount
    else
      for x in [1..amount]
        manaCostHtml += image_html url_color
  new Ember.Handlebars.SafeString manaCostHtml

