ActiveAdmin.register Slide do
  permit_params :list, :of, :attributes, :on, :model, :title, :slide_type
  belongs_to :slideshow

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
