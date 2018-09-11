# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end
end
