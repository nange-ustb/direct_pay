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

      "#{DirectPay.gateway_url}?#{query_string(options)}"
    end

    def self.query_string(options)
      options.merge(:sign_type => 'MD5', :sign => Sign.generate(options)).map do |key, value|
        "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
      end.join('&')
    end

    def self.check_required_options(options, names)
      names.each do |name|
        warn("DirectPay Warn: missing required option: #{name}") unless options.has_key?(name.to_sym)
      end
    end
  end
end
