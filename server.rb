require 'openssl'
require 'socket'                 # Get sockets from stdlib
require 'pry'
class Server

  server = TCPServer.open(8038)
  hostname = 'localhost'
  #wysyłam  wiadomość1
  #muszę tutaj wysłać wiadomość z podstawą i generatorem

  prime = 23
  generator = 5
  a = 6
  properS = 2
  numberA= (generator**a) % prime

  client = server.accept
  message1 = numberA
  client.puts(message1)

  client.close
  ####odbieram  wiadomoś2
  port2=8039
  s = TCPSocket.open(hostname, port2)
  line = s.gets     # Read lines from the socket
  message2 =  line.chop
  puts message2
  number2 = message2.to_i
  probableNumber = (number2**a) % prime

  if probableNumber == properS
    puts "ok"
  else
    puts "not ok"
  end  

  s.close

end
