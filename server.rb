require 'openssl'
require 'socket'                 # Get sockets from stdlib
require 'pry'
class Server

  server = TCPServer.open(8044)

     # Socket to listen on port 2000
  loop {                           # Servers run forever
     client = server.accept        # Wait for a client to connect
     message = "lalala"

     cipher = OpenSSL::Cipher::AES256.new :CBC
     cipher.encrypt
     key = 'ThisPasswordIsReallyHardToGuess!'

     iv = cipher.random_iv
     cipher.key = key
     
     encrypted = cipher.update(message) + cipher.final
     tosend2 = encrypted + "," + iv
     client.puts(tosend2)
     client.close                  # Disconnect from the client
  }

end
