require 'spec_helper'

describe Word do
  context 'schema' do
    it { should have_db_column(:name) }
  end
end
