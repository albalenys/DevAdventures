# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin do
  it 'has a valid factory' do
    FactoryBot.create(:admin).should be_valid
  end

  it 'is invalid without a username' do
    FactoryBot.build(:admin, username: nil).should_not be_valid
  end

  it 'is invalid without a password' do
    FactoryBot.build(:admin, password: nil).should_not be_valid
  end

  it 'is invalid without a unique username' do
    admin1 = FactoryBot.create(:admin, username: 'abby')
    admin2 = FactoryBot.build(:admin, username: 'abby')
    admin2.should_not be_valid
  end
end
