module Admin

  class LogsController < ApplicationController

    include LogsHelper

    def index
      @logs = get_logs(Rails.env)

      if params[:format] == 'json'
        render json: @logs
      end
    end

    def raw
      @logs = File.open("#{Rails.root}/log/#{params[:env]}.log").read
    end

  end

end
