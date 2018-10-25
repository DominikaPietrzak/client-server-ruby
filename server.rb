require 'openssl'
require 'socket'                 # Get sockets from stdlib
require 'pry'

  server = TCPServer.open(8044)

     # Socket to listen on port 2000
  loop {                           # Servers run forever
     client = server.accept        # Wait for a client to connect
     message = "lalala"

     cipher = OpenSSL::Cipher::AES256.new :CBC
     cipher.encrypt
     key = 'ThisPasswordIsReallyHardToGuess!'
     iv = cipher.random_iv
     File.open('iv', 'w') { |file| file.write(iv) }
     cipher.key = key
     encrypted = cipher.update(message) + cipher.final
     client.puts(encrypted)   # Send the time to the client
     client.close                  # Disconnect from the client
  }
