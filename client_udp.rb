require 'socket'

host = 'localhost'
porta = 4001 
socket = UDPSocket.new
socket.bind('localhost', porta)

puts "Cliente UDP aguardando na porta #{porta}..."

Thread.new do
  loop do
    mensagem, cliente = socket.recvfrom(1024)
    puts "\nRecebido de #{cliente[3]}: #{mensagem}"
    print "Cliente: "
  end
end

loop do
  print "Cliente: "
  texto = gets.chomp
  socket.send(texto, 0, host, 4000)
end
