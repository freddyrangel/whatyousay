require 'spec_helper'

describe DefinitionSerializer do

  let(:definition) { create(:definition) }
  let(:serializer) { DefinitionSerializer.new(definition).to_json }
  let(:response)   { JSON.parse(serializer, symbolize_names: true) }

  it "should return id" do
    expect(response[:id]).to eq(definition.id)
  end

  it "should return meaning" do
    expect(response[:meaning]).to eq(definition.meaning)
  end

  it "should return example" do
    expect(response[:example]).to eq(definition.example)
  end
end
