ActiveAdmin.register Content do
  permit_params :list, :of, :attributes, :on, :model, :body
  belongs_to :slide

  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
