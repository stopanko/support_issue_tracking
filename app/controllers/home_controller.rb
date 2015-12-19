class HomeController < ApplicationController

  def index
    uri = URI("https://raw.githubusercontent.com/stopanko/support_issue_tracking/master/README.md")
    r = Net::HTTP.get(uri)
    @response = Octokit.markdown(r, :mode => "gfm", :context => "octokit/octokit.rb")
  end
end
