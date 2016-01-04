require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "create ticket" do
    # let(:problem_type){create(:problem_type)}
    # let(:status){create(:status)}
    # let(:status2){create(:status)}
    let(:ticket){create(:ticket)}
    before :all do

    end
    it "create ticket success" do
      expect(Ticket.find(ticket.id)).to eq(ticket)
    end

    it "create_ticket with error" do
      expect{create(:ticket, user_name: "")}.to raise_error
    end

    it "change status after create comment" do
      p "ticket.status_id"
      p ticket.status_id
      # ticket.update_attributes(status_id: Status.last.id)
      status_id = ticket.status_id
      create(:comment, text:"sdad", commentable_id: ticket.id, commentable_type: "Ticket")
      p "ticket.status_id"
      p ticket.status_id
      expect(ticket.status_id).not_to eq(status_id)
    end

  end
end
