require 'openssl'
require 'socket'
require 'pry'        # Sockets are in standard library

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

@key = 'ThisPasswordIsReallyHardToGuess!'
while line = s.gets     # Read lines from the socket
   encrypted =  line.chop
   decipher = OpenSSL::Cipher::AES256.new :CBC
   decipher.decrypt
   File.open("iv", "r") do |f|
     f.each_line do |line|
       @iv = line
     end
   end

   decipher.key = @key
   decipher.iv = @iv
   plain = decipher.update(encrypted) + decipher.final   # And print with platform line terminator
   puts plain
   puts encrypted
end
s.close
