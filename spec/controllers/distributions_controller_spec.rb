require 'rails_helper'

RSpec.describe DistributionsController, type: :controller do

  before do
    ActionMailer::Base.deliveries = ['admin@admin.com']
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'create distribution' do
        expect {
          post :create, params: { distribution: {title: 'title', body: 'body', email: 'email', time: '1', randomizer: false } }
        }.to change(Distribution, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'not create ticket' do
        expect {
          post :create, params: { distribution: {body: 'body', email: 'email', time: '1', randomizer: false } }
        }.to change(Distribution, :count).by(0)
      end
    end
  end



end