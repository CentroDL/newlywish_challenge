module LogsHelper

  #leaving this in for testing
  def raw_logs(env)
    raw_logs = File.open( "#{Rails.root}/log/#{env}.log" ).read
  end

  def get_logs(env)

    #split by the UUID and messages
    log_uuid_pairs = raw_logs(env).split(/(\[\w{8}-\w{4}-\w{4}-\w{4}-\w{12}\])/).reject { |entry| entry.empty? }

    # this is specific to Heroku, hand rolling logging scheme should eliminate the need for this
    log_uuid_pairs.shift if env == "production"

    indexed_logs = {}

    log_uuid_pairs.each_slice(2) do |pair|

      key = pair[0].gsub(/[\[\]]/,"") #the regex just gets rid of brackets chars
      msg = pair[1]

      if indexed_logs[key]
        indexed_logs[key] += msg
      else
        indexed_logs[key] = msg
      end

    end

    indexed_logs
  end

end
