# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    FactoryBot.create(:post).should be_valid
  end

  it 'is invalid without a title' do
    FactoryBot.build(:post, title: nil).should_not be_valid
  end

  it 'is invalid without content' do
    FactoryBot.build(:post, content: nil).should_not be_valid
  end
end
