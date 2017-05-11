require 'rails_helper'

RSpec.describe 'Slideshows API', type: :request do
  let!(:slideshows) { create_list(:slideshow, 10)}
  let(:slideshow_id) { slideshows.first.id }

  describe 'GET' do
    describe '/slideshows' do
      before {get '/slideshows'}

      it 'returns all slideshows' do
        expect(json).to_not be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe '/slideshows/:id' do
      before { get "/slideshows/#{slideshow_id}" }

      context 'when the slideshow exists' do
        it 'returns the slideshow' do
          expect(json).not_to be_empty
          expect(json['id']).to eq(slideshow_id)
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

      end

      context 'when the slideshow does not exist' do
        it 'returns a missing resource message' do
        end
        it 'returns status code 404' do
        end
      end
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

