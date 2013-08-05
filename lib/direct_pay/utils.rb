module DirectPay
  module Utils
    def self.symbolize_keys(hash)
      hash.inject({}){|r,(k,v)| r[k.to_sym] = v;r}
    end

    def self.to_query_string(options)
      options.merge(:sign_type => 'MD5', :sign => Sign.generate(options)).map do |key, value|
        "#{CGI.escape(key.to_s)}=#{CGI.escape(value.to_s)}"
      end.join('&')
    end
  end
end
