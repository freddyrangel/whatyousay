class WordsController < ApplicationController

  def index
    words = Word.all
    render json: words, status: 200
  end

  def show
    word = Word.find(params[:id])
    render json: word, status: 200
  end

  def create
    word = Word.new(word_params)

    if word.save
      render json: word, status: 201, location: word
    else
      render json: word.errors, status: 422
    end
  end

  private
  
  def word_params
    params.require(:word).permit(:name)
  end
end
