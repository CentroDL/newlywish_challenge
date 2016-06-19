class WelcomeController < ApplicationController

  def index
    @logs = get_logs(Rails.env)
  end

  def raw
    @logs = File.open("#{Rails.root}/log/#{params[:env]}.log").read
  end

end
