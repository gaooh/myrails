class Util
  RAND_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz"

  def self.random_string(len)
    rand_max = RAND_CHARS.size
    ret = ""
    len.times{ ret << RAND_CHARS[rand(rand_max)] }
    ret
  end
  
end