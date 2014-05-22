require 'spec_helper'

describe UserSerializer do

  let(:user)        { create(:user) }
  let(:serializer)  { UserSerializer.new(user).to_json }
  let(:response)    { JSON.parse(serializer, symbolize_names: true) }

  it "should return id" do
    expect(response[:id]).to eq(user.id)
  end

  it "should return user_name" do
    expect(response[:user_name]).to eq(user.user_name)
  end

  it "should return email" do
    expect(response[:email]).to eq(user.email)
  end

  it "should return first_name" do
    expect(response[:first_name]).to eq(user.first_name)
  end

  it "should return last_name" do
    expect(response[:last_name]).to eq(user.last_name)
  end
end
