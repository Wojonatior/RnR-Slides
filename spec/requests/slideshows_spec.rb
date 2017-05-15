require 'rails_helper'

RSpec.describe 'Slideshows API', type: :request do
  let!(:slideshows) { create_list(:slideshow, 10)}
  let(:slideshow_id) { slideshows.first.id }

  describe 'GET' do
    describe '/slideshows' do
      before {get api_prefix('/slideshows')}

      it 'returns all slideshows' do
        expect(json).to_not be_empty
        expect(json.size).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    describe '/slideshows/:id' do
      before { get api_prefix("/slideshows/#{slideshow_id}") }

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
        let(:slideshow_id) { 100 }

        it 'returns a missing resource message' do
          expect(response.body).to match(/Couldn't find Slideshow/)
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end
  end

  describe 'POST' do
    describe '/slideshows' do
      let(:valid_payload) { { title: 'Test Title' } }

      context 'with a valid request' do
        before { post api_prefix('/slideshows'), params: valid_payload }

        it 'creates a slideshow' do
          expect(Slideshow.count).to eq(11)
          expect(Slideshow.all[10]['title']).to eq('Test Title')
          expect(json['title']).to eq('Test Title')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'with an invalid request' do
        before { post api_prefix('/slideshows'), params: { title: "" } }
        it 'returns a failure message' do
          expect(Slideshow.count).to eq(10)
          expect(response.body).to match(/Validation failed:/)
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
      end
    end
  end

  describe 'PUT' do
    describe '/slideshows/:id' do
      before { put api_prefix("/slideshows/#{slideshow_id}"), params: payload}

      context 'with a valid payload' do
        let(:payload) { { title: 'My New Title' } }

        context 'when the slideshow exists' do
          it 'modifies the slideshow' do
            expect(response.body).to be_empty
            expect(Slideshow.all[0]['title']).to eq('My New Title')
          end
          it 'returns status code 204' do
            expect(response).to have_http_status(204)
          end
        end

        context 'when the slideshow does not exist' do
          let(:slideshow_id) { 100 }

          it 'returns a missing resource message' do
            expect(response.body).to match(/Couldn't find Slideshow/)
          end

          it 'returns status code 404' do
            expect(response).to have_http_status(404)
          end
        end
      end
      context 'with an invalid payload' do
        let(:payload) { { title: '' } }

        it 'returns a failure message' do
          expect(Slideshow.count).to eq(10)
          expect(response.body).to match(/Validation failed:/)
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
      end
    end
  end

  describe 'DELETE' do
    describe '/slideshows/:id' do
      before { delete api_prefix("/slideshows/#{slideshow_id}")}

      context 'when the slideshow exists' do
        it 'deletes the record' do
          expect(Slideshow.count).to eq(9)
        end

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
      context 'when the slideshow does not exist' do
        let(:slideshow_id) { 100 }

        it 'returns a missing resource message' do
          expect(response.body).to match(/Couldn't find Slideshow/)
          expect(Slideshow.count).to eq(10)
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end
  end
end
