require 'spec_helper'

describe WordSerializer do

  let(:word)        { create(:word) }
  let(:serializer)  { WordSerializer.new(word).to_json }
  let(:response)    { JSON.parse(serializer, symbolize_names: true) }

  it "should return id" do
    expect(response[:id]).to eq(word.id)
  end

  it "should return name" do
    expect(response[:name]).to eq(word.name)
  end
end
