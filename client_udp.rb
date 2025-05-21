require 'socket'
require 'thread'

SERVER_IP = '127.0.0.1'
SERVER_PORT = 5000

client = UDPSocket.new
client.connect(SERVER_IP, SERVER_PORT)

puts "Conectado ao servidor UDP (#{SERVER_IP}:#{SERVER_PORT})"
puts "Digite suas mensagens. Pressione Ctrl+C para sair."

Thread.new do
  loop do
    begin
      msg, _ = client.recvfrom(1024)
      puts "\n#{msg.strip}"
      print "> "
    rescue
      break
    end
  end
end

loop do
  print "> "
  message = gets
  break if message.nil?

  client.send(message.strip, 0)
end