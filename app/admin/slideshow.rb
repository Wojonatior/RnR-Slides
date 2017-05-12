ActiveAdmin.register Slideshow do
  permit_params :list, :of, :attributes, :on, :model, :title

  show do
    h3 slideshow.title
    panel "Slides" do
      table_for slideshow.slides do
        column "Title" do |slide|
          link_to slide.title, admin_slideshow_slide_path(slide)
        end
        column :slide_type
      end
    end
  end

end
