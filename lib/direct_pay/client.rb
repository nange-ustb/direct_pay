require 'cgi'
require 'open-uri'

module DirectPay
  module Client
    def self.create_direct_pay_by_user_url(options)
      options = {
        :service        => 'create_direct_pay_by_user',
        :_input_charset => 'utf-8',
        :partner        => DirectPay.pid,
        :seller_email   => DirectPay.seller_email,
        :payment_type   => '1'
      }.merge(Utils.symbolize_keys(options))

      check_required_options(options, DirectPay.required_options)

      if options[:total_fee].nil? and (options[:price].nil? || options[:quantity].nil?)
        warn("DirectPay Warn: total_fee or (price && quantiry) must have one")
      end

      return "#{DirectPay.gateway_url}?#{Utils.to_query_string(options)}"
    end

    def self.check_required_options(options, names)
      names.each do |name|
        warn("DirectPay Warn: missing required option: #{name}") unless options.has_key?(name)
      end
    end
  end
end
