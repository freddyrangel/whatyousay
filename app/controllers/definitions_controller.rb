class DefinitionsController < ApplicationController

  def index
    definitions = word.definitions
    render json: definitions, status: 200
  end

  def show
    definition = get_definition
    render json: definition, status: 200
  end

  def create
    definition = word.definitions.new(definition_params)

    if definition.save
      render json: definition, status: 201, location: word_definition_path(word, definition)
    else
      render json: definition.errors, status: 422
    end
  end

  def update
    definition = get_definition

    if definition.update(definition_params)
      render json: definition, status: 200
    else
      render json: definition.errors, status: 422
    end
  end

  def destroy
    definition = get_definition
    definition.destroy
    head 204
  end

  private

  def word
    Word.find(params[:word_id])
  end

  def get_definition
    word.definitions.find(params[:id])
  end

  def definition_params
    params.require(:definition).permit(:meaning, :example)
  end
end
