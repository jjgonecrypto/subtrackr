require 'spec_helper'

describe Service do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "definition" do
    it { should be_kind_of(Mongoid::Document) }
    it { should be_timestamped_document }
    it { should have_fields(:name, :url, :desc, :category).of_type(String) }
  end
end
