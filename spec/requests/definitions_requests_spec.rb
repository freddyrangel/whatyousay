require 'spec_helper'

describe "/word" do

  let!(:word) { create(:word) }

  describe "GET '/definitions'" do

    let!(:definition) { create(:definition, word: word) }

    before(:each) do
      get "/words/#{word.id}/definitions", {}, { 'Accept' => Mime::JSON }
    end

    it "returns a list of definitions" do
      expected_response = word.definitions.map { |f| DefinitionSerializer.new(f) }.to_json
      expect(response.body).to eq(expected_response)
    end

    it "should return 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET '/definitions/:id'" do

    let!(:definition) { create(:definition, word: word) }

    before(:each) do
      get "/words/#{word.id}/definitions/#{definition.id}",
        {},
        { 'Accept' => Mime::JSON }
    end

    it "returns the definition" do
      expected_response = DefinitionSerializer.new(definition).to_json
      expect(response.body).to eq(expected_response)
    end

    it "should return 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "POST '/definitions'" do

    let!(:definition) { attributes_for(:definition, word: word) }

    let(:post_request) do
      post "/words/#{word.id}/definitions",
        { definition: definition, word_id: word.id }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    end

    it "should create a new definition" do
      expect { post_request }.to change(Definition, :count).by(1)
    end

    context 'response' do

      before(:each) { post_request }

      it "should send a status 201" do
        expect(response.status).to eq(201)
      end

      it "should send location with response" do
        expect(response.location).
          to eq(word_definition_path(word, Definition.last))
      end
    end

    context 'invalid request' do
      
      before(:each) do
        Definition.any_instance.stub(:valid?).and_return(false)
      end

      it "should not create the definition" do
        expect { post_request }.to change(Definition, :count).by(0)
      end

      context 'response' do

        before(:each) { post_request }

        it "should send status 422" do
          expect(response.status) == 422
        end
      end
    end
  end

  describe "PATCH '/definitions/:id'" do

    let!(:definition) { create(:definition, word: word) }

    let(:patch_request) do
      patch "/words/#{word.id}/definitions/#{definition.id}",
        { 
        definition: { 
          meaning: "New Meaning",
          example: "New Example" 
        }, 
        word_id: word.id }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    end

    before(:each) { patch_request }

    it "should return 200" do
      expect(response.status) == 200
    end

    it "should update meaning" do
      expect(definition.reload.meaning) == "New Meaning"
    end

    context 'invalid params' do

      before(:each) do
        Definition.any_instance.stub(:valid?).and_return(false)
        Definition.any_instance.stub(:errors).and_return("Invalid")
      end

      it "should return status 422" do
        expect response.status == 422
      end

      it "should send errors" do
        expect response.body == "Invalid"
      end
    end
  end

  describe "DELETE 'definitions/:id'" do

    let!(:definition) { create(:definition, word: word) }

    let(:delete_request) do
      delete "words/#{word.id}/definitions/#{definition.id}"
    end

    it "should destroy definition" do
      expect { delete_request }.to change(Definition, :count).by(-1)
    end

    it "should return status 204" do
      delete_request
      expect response.status == 204
    end
  end
end
