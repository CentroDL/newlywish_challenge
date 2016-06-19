class WelcomeController < ApplicationController

  def index
    @logs = get_logs(Rails.env)
  end

end
