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
      @logs = raw_logs params[:env]
    end

  end

end
