require 'spec_helper'

describe Word do

  context 'schema' do
    it { should have_db_column(:name) }
  end

  context 'validations' do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
  end

  context 'relations' do
    it { should have_many(:definitions) }
  end
end
