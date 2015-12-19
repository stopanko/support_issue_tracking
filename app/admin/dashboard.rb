ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Last Tickets" do
          @tickets = Ticket.order(created_at: :desc).first(10)
          table_for @tickets.each do |p|
            column("id")   {|t| t.id}
            column("email")   {|t| t.email}
            column("user_name")   {|t| t.user_name}
            column("status")   {|t| content_tag(:div, t.status.name, style: "background-color: #{t.status.color}")}
            column("problem_type")   {|t| t.problem_type.name}
            column("title")   {|t| t.title}
            column("link")   {|t| link_to "Edit", edit_admin_ticket_path(t.id)}
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
