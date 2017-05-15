require 'rails_helper'

RSpec.describe "Slides Spec" do
  let!(:slideshow) { create(:slideshow) }
  let!(:slides) { create_list(:slide, 20, slideshow_id: slideshow.id) }
  let(:slideshow_id) { slideshow.id }
  let(:slide_id) { slides.first.id }

  describe 'GET' do

    context '/slideshows/:slideshow_id/slides', :focus => true do
      before { get api_prefix("/slideshows/#{slideshow_id}/slides") }

      context 'with a slideshow that exists' do
        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end

        it 'returns all 20 slides' do
          expect(json.size).to eq(20)
        end
      end

      context 'with a slideshow that doesn\'t exist' do
        let(:slideshow_id) { 100 }

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Slideshow/)
        end
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end

    context '/slideshows/:slideshow_id/slides/:slide_id' do
      before { get api_prefix("/slideshows/#{slideshow_id}/slides/#{slide_id}") }

      context 'with a valid slide id' do
        it 'returns the slide' do
          expect(json['id']).to eq(slide_id)
        end
        it 'returns status code 200' do
          expect(response).to have_http_status(200)

        end
      end

      context 'with an invalid slide id' do
        let(:slide_id) { 0 }

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Slide/)
        end
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end

  end
  describe 'POST' do
    let(:payload) { { title: "A Slide", slide_type: "title" } }
    before { post api_prefix("/slideshows/#{slideshow_id}/slides"), params: payload}

    context '/slideshows/:slideshow_id/slides' do
      context 'with a valid payload' do
        it 'creates the slide' do
          expect(Slideshow.find(slideshow_id).slides.count).to eq(21)
          expect(Slideshow.find(slideshow_id).slides[20].title).to eq('A Slide')
          expect(json['title']).to eq('A Slide')
        end

        it 'returns status code 201' do
          expect(response).to have_http_status(201)
        end
      end

      context 'with an invalid payload' do
        let(:payload) { { title: "", slide_type: "" } }
        it 'returns a failure message' do
          expect(response.body).to match(/Validation failed:/)
        end

        it 'returns status code 422' do
          expect(response).to have_http_status(422)
        end
      end
    end

  end
  describe 'PUT' do
    before { put api_prefix("/slideshows/#{slideshow_id}/slides/#{slide_id}"), params: payload }
    let(:payload) { { title: "New Slide Title" } }

    context '/slideshows/:slideshow_id/slides/:slide_id' do
      context 'with an existing slide' do
        context 'with a valid payload' do
          it 'modifies the slide' do
            expect(Slideshow.find(slideshow_id).slides.first['title']).to eq("New Slide Title")
            expect(response.body).to be_empty
          end

          it 'returns status code' do
            expect(response).to have_http_status(204)
          end
        end
        context 'with an invalid payload' do
          let(:payload) { { title: "" } }

          it 'returns a failure message' do
            expect(response.body).to match(/Validation failed:/)
          end

          it 'returns status code 422' do
            expect(response).to have_http_status(422)
          end
        end
      end
      context 'with a nonexistant slide' do
        let(:slide_id) { 0 }

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Slide/)
        end
        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end

  end
  describe 'DELETE' do
    before { delete api_prefix("/slideshows/#{slideshow_id}/slides/#{slide_id}") }

    context '/slideshows/:slideshow_id/slides/:slide_id' do
      context 'with a valid slide id' do
        it 'deletes the slide' do
          expect(Slideshow.find(slideshow_id).slides.count).to eq(19)
        end

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
      context 'with an invalid slide id' do
        let(:slide_id) { 0 }

        it 'doesn\'t delete anything' do
          expect(Slideshow.find(slideshow_id).slides.count).to eq(20)
        end

        it 'returns a not found message' do
          expect(response.body).to match(/Couldn't find Slide/)
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end
  end
end
