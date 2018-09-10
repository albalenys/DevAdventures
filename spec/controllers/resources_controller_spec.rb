# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  let(:post) { FactoryGirl.create :post }
  let(:admin) { FactoryGirl.create :admin }

  describe 'GET #new' do
    it 'should redirect if not logged in as admin' do
      visit new_post_resource_path(post)
      response.should redirect_to(root_path)
    end

    it 'allows access if logged in as admin' do
      login_as(admin)
      visit new_post_resource_path(post)
      response.should render_template new_post_resource_path(post)
    end
  end

  # describe "POST #create" do
  # end

  # describe "DELETE #destroy" do
  # end

  # describe "GET #edit" do
  # end

  # describe "PUT #update" do
  # end
end
