module DirectPay
  module Utils
    def self.symbolize_keys(hash)
      hash.inject({}){|r,(k,v)| r[k.to_sym] = v;r}
    end
  end
end
