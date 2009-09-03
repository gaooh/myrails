require 'net/https'

class DrecomOffice
  def self.auth(user, pass)
    req = Net::HTTP::Get.new("/rss/latest")
    req.basic_auth user, pass

    https = Net::HTTP.new('intra.office.drecom.jp', 443)
    https.use_ssl = true

    https.start do |w|
      response = w.request(req)

      case response
      when Net::HTTPClientError
        return false
      when Net::HTTPServerError
        return false
      else
        return true
      end
    end
  end
end