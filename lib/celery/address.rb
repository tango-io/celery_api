module Celery

  class Address < Base
    attr_accessor :company_name, :street, :street2,
      :city, :state, :zip, :country, :phone
  end

end
