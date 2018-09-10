# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin, type: :model do
  it 'has a valid factory' do
    FactoryGirl.create(:admin).should be_valid
  end

  it 'is invalid without a username' do
    FactoryGirl.build(:admin, username: nil).should_not be_valid
  end

  it 'is invalid without a password' do
    FactoryGirl.build(:admin, password: nil).should_not be_valid
  end

  it 'is invalid without a unique username' do
    admin1 = FactoryGirl.create(:admin, username: 'abby')
    admin2 = FactoryGirl.build(:admin, username: 'abby')
    admin2.should_not be_valid
  end
end
