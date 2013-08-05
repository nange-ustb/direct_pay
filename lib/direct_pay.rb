require "direct_pay/version"
require "direct_pay/utils"
require "direct_pay/sign"
require "direct_pay/client"
module DirectPay
  class << self
    attr_accessor :pid
    attr_accessor :key
    attr_accessor :seller_email
    attr_accessor :seller_email

    def gateway_url
    	'https://mapi.alipay.com/gateway.do'
    end

    def required_options
    	%w( service partner _input_charset out_trade_no subject payment_type seller_email )
    end
  end
end
