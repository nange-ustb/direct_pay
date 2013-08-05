require "direct_pay/version"
require "direct_pay/utils"
require "direct_pay/sign"
require "direct_pay/client"
module DirectPay
  class << self
    attr_accessor :pid
    attr_accessor :key
    attr_accessor :seller_email
  end
end
