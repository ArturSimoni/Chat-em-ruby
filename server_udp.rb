require 'socket'

PORT = 5000
server = UDPSocket.new
server.bind("0.0.0.0", PORT)

clients = []

puts "Servidor UDP iniciado na porta #{PORT}..."

loop do
  msg, addr = server.recvfrom(1024)
  client_info = addr[3] + ":" + addr[1].to_s

  unless clients.include?(addr)
    clients << addr
    puts "Novo cliente conectado: #{client_info}"
  end

  puts "Mensagem recebida de #{client_info}: #{msg.strip}"

  clients.each do |client|
    next if client == addr
    server.send("#{client_info} diz: #{msg}", 0, client[3], client[1])
  end
end
