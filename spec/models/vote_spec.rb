require 'spec_helper'

describe Vote do
  context 'schema' do
    it { should have_db_column(:definition_id) }
  end

  context 'relations' do
    it { should belong_to(:definition) }
  end
end
