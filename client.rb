require 'openssl'
require 'socket'
require 'pry'        # Sockets are in standard library

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)


while line = s.gets     # Read lines from the socket
   encrypted =  line.chop
  binding.pry
   decipher = OpenSSL::Cipher::AES256.new :CBC
   decipher.decrypt

   key = 'ThisPasswordIsReallyHardToGuess!'

   decipher.key = key
   decipher.iv = iv
   plain = decipher.update(encrypted) + decipher.final   # And print with platform line terminator
   puts plain
end
s.close
