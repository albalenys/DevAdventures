# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource do
  it 'has a valid factory' do
    FactoryBot.create(:resource).should be_valid
  end

  it 'is invalid without a title' do
    FactoryBot.build(:resource, title: nil).should_not be_valid
  end

  it 'is invalid without a url' do
    FactoryBot.build(:resource, url: nil).should_not be_valid
  end
end
