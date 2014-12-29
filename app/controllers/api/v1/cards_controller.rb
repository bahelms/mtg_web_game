class Api::V1::CardsController < ApplicationController
  respond_to :json

  def index
    respond_with Card.all.sort_by(&:name)
  end
end

