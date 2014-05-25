require 'spec_helper'

describe "/words" do

  describe "GET '/words'" do

    let!(:word) { create(:word) }

    before(:each) do
      get '/words', {}, { 'Accept' => Mime::JSON }
    end

    it "should return a list of words in JSON" do
      words = Word.all.map{ |f| WordSerializer.new(f) }.to_json
      expect(response.body).to eq(words)
    end

    it "should return 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "GET '/words/:id'" do
    let!(:word) { create(:word) }

    before(:each) do
      get "/words/#{word.id}", {}, { 'Accept' => Mime::JSON }
    end

    it "should return the word in JSON" do
      word = WordSerializer.new(Word.last).to_json
      expect(response.body).to eq(word)
    end

    it "should return 200" do
      expect(response.status).to eq(200)
    end
  end

  describe "POST '/words'" do

    let(:create_request) do
      post "/words",
        { word: 
         { name: "Chela" } 
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
    end

    it "should create a new word" do
      expect { create_request }.to change(Word, :count).by(1)
    end

    context 'response' do

      before(:each) { create_request }

      it "should send a status 201" do
        expect(response.status).to eq(201)
      end

      it "should send location with response" do
        word = json(response.body)
        expect(response.location).to eq(word_url(word[:id]))
      end
    end

    context "invalid request" do

      let(:invalid_create_request) do
        post "/words",
          { word: 
           { name: nil } 
        }.to_json,
        { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }
      end

      it "should not create word" do
        expect { invalid_create_request }.to change(Word, :count).by(0)
      end

      context 'response' do

        before(:each) { invalid_create_request }

        it "should send status 422" do
          expect(response.status).to eq(422)
        end

        it "should render errors" do
          expect(response.body).to include("no puede estar en blanco")
        end
      end
    end
  end
end
