require 'openssl'
require 'socket'
require 'pry'        # Sockets are in standard library
class Client

  hostname = 'localhost'
  port1 = 8038
  properS = 2
  #odbieram wiadomość
  client = TCPSocket.open(hostname, port1)
  line = client.gets     # Read lines from the socket
  message1 =  line.chop
  numberA = message1.to_i
  generator  = 5
  prime = 23
  b= 15
  numberB = (generator**b) % prime

  client.close
  ####wysyłam wiadomość 2
  server = TCPServer.open(8039)
  server = server.accept
  message2 =  numberB
  probableNumber = (numberA**b) % prime

  ### sprawdzam czy takie same

  if probableNumber == properS
    server.puts(message2)
    puts "ok"
  else
    puts "ok"
  end

  server.close



end
