require 'spec_helper'

describe Definition do

  context 'schema' do
    it { should have_db_column(:meaning) }
    it { should have_db_column(:example) }
    it { should have_db_column(:word_id) }
  end

  context 'relations' do
    it { should belong_to(:word) }
    it { should have_many(:votes) }
  end
end
