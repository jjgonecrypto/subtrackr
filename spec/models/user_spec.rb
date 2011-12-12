require 'spec_helper'

describe User do
  context "definition" do
    it { should be_kind_of(Mongoid::Document) }
    it { should be_timestamped_document }

    #it { should have_field(:phone_number) }
    #it { should have_field(:password_hash) }
    #it { should have_field(:salt) }
  end
end
