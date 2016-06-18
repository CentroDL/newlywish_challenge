class WelcomeController < ApplicationController

  def index
    @logs = File.open( "#{Rails.root}/log/#{Rails.env}.log" ).read.split("[")
  end

end
