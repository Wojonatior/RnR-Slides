require 'rails_helper'

RSpec.describe 'Slideshows API', type: :request do
  let!(:slideshows) { create_list(:slideshow, 10)}
  let(:slideshow_id) { slideshows.first.id }

  describe 'GET' do
    describe '/slideshows' do
      before {get '/slideshows'}

      it 'returns all slideshows' do
        json = JSON.parse(response.body)
        expect(json).to_not be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

    end
    describe '/slideshows/:id' do
    end
  end

  describe 'POST' do
    describe '/slideshows' do
    end
  end

  describe 'PUT' do
    describe '/slideshows/:id' do
    end
  end

  describe 'DELETE' do
    describe '/slideshows/:id' do
    end
  end
end

