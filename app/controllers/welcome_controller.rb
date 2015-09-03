class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.where(show: true).order(clicks: :desc).first

  end
end
