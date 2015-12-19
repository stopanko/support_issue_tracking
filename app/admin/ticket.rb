ActiveAdmin.register Ticket do


  permit_params :problem_type_id, :status_id, :admin_user_id, :admin_update_id, :title, :text, comments_attributes:[:admin_user_id, :id, :_destroy, :text], comments_ids:[]

  actions :index, :show, :edit, :update, :ticket_history

  filter :id
  filter :problem_type_id, as: :select
  filter :status_id, as: :select
  filter :email
  filter :user_name
  filter :title
  filter :created_at
  filter :updated_at

  after_update do |ticket|
    UserMailer.ticket_updated(ticket).deliver
  end

  scope :all_tickets
  Status.order("name DESC").each do |status|
    scope status.name.to_sym
  end

  # ProblemType.all.each do |type|
  #   scope type.name.to_sym, ->{where(problem_type_id: type.id)}
  # end

  member_action :ticket_history, method: :get do
    @ticket_histories = resource.get_histories.limit(5)
  end


  index do
    id_column
    column :email
    column :user_name
    column :title
    column :status do |o|
      "<div style='background-color:#{o.status.color}'>#{o.status.name}</div>".html_safe
    end
    column :problem_type
    column :created_at
    column :updated_at
    actions
    column :history do |o|
      link_to "History", ticket_history_admin_ticket_path(o.id)
    end
  end

  form  do |f|
    f.inputs :tickets do
      f.input :admin_user_id, as: :select, collection: options_from_collection_for_select(AdminUser.all, "id", "email", f.object.admin_user_id)
      f.input :problem_type
      f.input :status_id, as: :select, collection: options_from_collection_for_select(Status.all, "id", "name", f.object.status_id)
      f.input :email, input_html: {disabled: true}
      f.input :user_name, input_html: {disabled: true}
      f.input :title
      f.input :text
      f.input :admin_update_id, as: :hidden, input_html: {value: current_admin_user.id}
      f.has_many :comments, allow_destroy: true do |c|
        c.input :text
        if c.object.new_record?
          c.input :admin_user_id, as: :hidden, input_html: {value: current_admin_user.id}
        end
      end
    end

    f.actions

  end


end
