require "json"
require 'open-uri'

class GamesController < ApplicationController

  def new
    alphabet = ("a".."z").to_a
    @letters = alphabet.sample(10)

  end

  def score
    @letters = params[:letters]
    @user_input = params[:input]

    @arr = @letters.split(" ")

    @arr.each do |letter|
      if @user_input.include? (letter)
        @answer = "Sorry but #{@user_input} cant be build out of #{letter}"
      elsif parse(@user_input) == false
        @answer = "Sorry but #{@user_input} does not seem to be a valid English word..."
      else
        @answer = "Congratulation! #{@user_input} is a valid English word!"
      end
    end
  end

  def parse(keyword)
    url = "https://wagon-dictionary.herokuapp.com/#{keyword}"
    file = URI.open(url).string
    data_hash = JSON.parse(file)
    data_hash["found"]
  end
end
