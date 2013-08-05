require 'digest/md5'

module DirectPay
  module Sign
    def self.generate(params)
      query = params.map do |key, value|
        "#{key.to_s}=#{value}"
      end.join('&')

      Digest::MD5.hexdigest("#{query}#{DirectPay.key}")
    end
  end
end
