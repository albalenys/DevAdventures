# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project do
  it 'has a valid factory' do
    FactoryBot.create(:project).should be_valid
  end

  it 'is invalid without a title' do
    FactoryBot.build(:project, title: nil).should_not be_valid
  end

  # it 'is invalid without a url' do
  #   FactoryBot.build(:project, url: nil).should_not be_valid
  # end
end
