# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Resource, type: :model do
  it 'has a valid factory' do
    FactoryGirl.create(:resource).should be_valid
  end

  it 'is invalid without a title' do
    FactoryGirl.build(:resource, title: nil).should_not be_valid
  end

  it 'is invalid without a url' do
    FactoryGirl.build(:resource, url: nil).should_not be_valid
  end
end
