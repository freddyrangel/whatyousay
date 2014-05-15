require 'spec_helper'

describe User do
  context 'schema' do
    it { should have_db_column(:email) }
    it { should have_db_column(:first_name) }
    it { should have_db_column(:last_name) }
    it { should have_db_column(:password_digest) }
    it { should have_db_column(:provider) }
    it { should have_db_column(:uid) }
    it { should have_db_column(:oauth_token) }
    it { should have_db_column(:oauth_expires_at) }
  end

  context 'relations' do
    it { should have_many(:definitions) }
  end

  context 'validations' do
    it { should validate_presence_of(:user_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:user_name) }
    it { should validate_uniqueness_of(:email) }
  end
end
