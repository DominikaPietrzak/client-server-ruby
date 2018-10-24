require 'openssl'
require 'socket'        # Sockets are in standard library

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)


while line = s.gets     # Read lines from the socket
   encrypted =  line.chop

   decipher = OpenSSL::Cipher::AES.new(128, :CBC)
   decipher.decrypt
   #decipher.padding = 0
   key = 'abcd'
   iv = '08F33A959938C56E518F9239EDB4D801'
   decipher.key = key
   decipher.iv = iv
   plain = decipher.update(encrypted) + decipher.final   # And print with platform line terminator
   puts plain
end
s.close
