ActiveAdmin.register ProblemType do


  permit_params :name, :active
  actions :index, :show, :edit, :update, :new, :create


end
