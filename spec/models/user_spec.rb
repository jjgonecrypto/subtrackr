require 'spec_helper'

describe User do
  context "definition" do
    it { should be_kind_of(Mongoid::Document) }
    it { should be_timestamped_document }

    it { should have_field(:username) }
    it { should validate_presence_of(:username) }

    it { should have_field(:email) }
    it { should validate_uniqueness_of(:email) }
    
    it { should have_field(:password) }
  end
end
