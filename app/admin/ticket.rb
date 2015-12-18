ActiveAdmin.register Ticket do


  permit_params :problem_type_id, :status_id, :admin_update_id, :title, :text, comments_attributes:[:admin_user_id, :id, :_destroy, :text], comments_ids:[]


  form  do |f|
    f.inputs :tickets do
      f.input :problem_type
      f.input :status
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
