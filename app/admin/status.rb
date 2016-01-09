ActiveAdmin.register Status do

  permit_params :name, :color, :active, :costumer_default, :admin_default

  actions :index, :show, :edit, :new

  scope :all
  scope :costumer_default
  scope :admin_default

  filter :id
  filter :name
  filter :active
  filter :costumer_default
  filter :admin_default
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :name
    column :active
    column :created_at
    column :updated_at
    column :costumer_default
    column :admin_default
    column :color do |o|
      "<div style= 'background-color:#{o.color}'>&nbsp;</div>".html_safe
    end
    actions
  end


end
