require 'socket'

porta = 4000
socket = UDPSocket.new
socket.bind('localhost', porta)

puts "Servidor UDP aguardando na porta #{porta}..."

Thread.new do
  loop do
    mensagem, cliente = socket.recvfrom(1024)
    puts "\nRecebido de #{cliente[3]}: #{mensagem}"
    print "Servidor: "
  end
end

loop do
  print "Servidor: "
  texto = gets.chomp
  socket.send(texto, 0, 'localhost', 4001)
end
