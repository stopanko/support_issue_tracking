ActiveAdmin.register Status do

  permit_params :name, :color, :active, :customer_default, :admin_default
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


  index do
    selectable_column
    id_column
    column :name
    column :active
    column :created_at
    column :updated_at
    column :customer_default
    column :admin_default
    column :color do |o|
      "<div style= 'background-color:#{o.color}'>&nbsp;</div>".html_safe

    end
    actions
  end


end
