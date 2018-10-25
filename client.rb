require 'openssl'
require 'socket'
require 'pry'        # Sockets are in standard library
class Client

  hostname = 'localhost'
  port = 8044

  s = TCPSocket.open(hostname, port)

  key = 'ThisPasswordIsReallyHardToGuess!'
  decipher = OpenSSL::Cipher::AES256.new :CBC
  while line = s.gets     # Read lines from the socket
     encrypted =  line.chop
     messageWithIv = encrypted.split(',', 2)
     messages = messageWithIv[0]
     iv = messageWithIv[1]

     decipher.key = key
     decipher.iv = iv
     plain = decipher.update(messages) + decipher.final   # And print with platform line terminator
     puts plain
     puts messages
  end
  s.close

end
