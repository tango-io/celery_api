module Celery

  class UsersProcessor < ProcessorBase

    def initialize(endpoint=nil, access_token=nil)
      super
      @endpoint_path = endpoint + "users/me" if endpoint
    end

    def me
      @me ||= Celery::User.new(get_user['data'])
    end

    private
    def get_user
      return HTTParty.get("#{endpoint_path}?#{parameterize_options}")
    end

  end

end
