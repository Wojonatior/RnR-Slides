require 'rails_helper'

RSpec.describe 'Slides API' do
  let!(:slideshow) { create(:slideshow) }
  let!(:items) { create_list(:slide, 20, slideshow_id: slideshow.id) }
  let(:slideshow_id) { slideshow.id }
  let(:id) { items.first.id }

  describe 'GET' do
    before { get "/slideshows/#{slideshow_id}/slides" }
    context '/slideshows/:slideshow_id/slides' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all 20 slides' do
        expect(json.size).to eq(20)
      end
    end
    context '/slideshows/:slideshow_id/slides/:slide_id'
  end
  describe 'POST' do
    context '/slideshows/:slideshow_id/slides'
  end
  describe 'PUT' do
    context '/slideshows/:slideshow_id/slides/:slide_id'
  end
  describe 'DELETE' do
    context '/slideshows/:slideshow_id/slides/:slide_id'
  end

end
