require 'openssl'
require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)

   # Socket to listen on port 2000
loop {                           # Servers run forever
   client = server.accept        # Wait for a client to connect
   message = "lalala"

   cipher = OpenSSL::Cipher::AES.new(128, :CBC)
   cipher.encrypt
   key = 'abcd'
   iv = '08F33A959938C56E518F9239EDB4D801'

   cipher.key = key
   encrypted = cipher.update(message) + cipher.final
   client.puts(encrypted + "\n")   # Send the time to the client
   client.puts(key)
   client.puts "Closing the connection. Bye!"
   client.close                  # Disconnect from the client
}
