module Celery

  module Config
    def access_token=(access_token)
      @access_token = access_token
    end

    def access_token
      @access_token
    end

    def endpoint
      @endpoint ||= "https://api.trycelery.com/v1/"
    end

    def parameterize_options(args={})
      args.merge!(access_token: access_token)
      uri              = Addressable::URI.new
      uri.query_values = args
      uri.query
    end
  end

end
