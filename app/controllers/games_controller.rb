class GamesController < ApplicationController

  def new
    alphabet = ("a".."z").to_a
    @letters = alphabet.sample(10)

  end

  def scores

  end

end
