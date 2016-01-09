ActiveAdmin.register ProblemType do


  permit_params :name, :active
  actions :index, :show, :edit, :new, :destroy


end
