require 'rails_helper'
require 'spec_helper'

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:project).should be_valid
  end

  it "is invalid without a title" do
    FactoryGirl.build(:project, title: nil).should_not be_valid
  end

  it "is invalid without a url" do
    FactoryGirl.build(:project, url: nil).should_not be_valid
  end
end
