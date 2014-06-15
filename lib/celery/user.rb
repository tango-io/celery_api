module Celery

  class User < Base

    attr_accessor :created, :updated, :created_date, :updated_date,
      :_id, :id, :email, :name, :currency, :webhooks, :notifications,
      :shipping_rates, :tax_rates, :nexus, :stripe, :affirm, :paypal_email,
      :analytics, :flags, :confirmation_url, :twitter, :facebook, :website,
      :subscription, :business, :has_affirm, :message_to_buyer, :access_token,
      :emails, :has_paypalx

  end

end
