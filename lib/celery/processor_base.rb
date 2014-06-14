module Celery

  class ProcessorBase
    attr_reader :endpoint_path, :access_token

    def initialize(endpoint=nil, access_token=nil)
      @access_token  = access_token
    end

    private


    def parameterize_options(args={})
      args.merge!(access_token: access_token)
      uri              = Addressable::URI.new
      uri.query_values = args.merge(access_token: access_token)
      uri.query
    end
  end

end
