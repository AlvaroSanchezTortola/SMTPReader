require 'socket'
$LOAD_PATH << '.'
require "ex2"

class Server
	def initialize
		@server = TCPServer.open(2000)    # Socket to listen on port 2000
		run
	end
	def run
		loop {                           # Servers run forever
		   puts "Server Initialized!"
		   Thread.start(@server.accept) do |client|
		   client.puts(Time.now.ctime)   # Send the time to the client
		   calc = Calculator.new
		   listen( client, calc )
		   end
		}.join
	end
	def listen( client, calc )
		loop {
		      aux = client.gets.chomp
		      puts aux
		      if (aux == "boton0") then
		      	calc.boton0
		      elsif (aux == "boton1") then
		      	calc.boton1
		      elsif (aux == "boton2") then
		      	calc.boton2
		      elsif (aux == "boton3") then
		      	calc.boton3
		      elsif (aux == "boton4") then
		      	calc.boton4
		      elsif (aux == "boton5") then
		      	calc.boton5
		      elsif (aux == "boton6") then
		      	calc.boton6
		      elsif (aux == "boton7") then
		      	calc.boton7
		      elsif (aux == "boton8") then
		      	calc.boton8
		      elsif (aux == "boton9") then
		      	calc.boton9
		      elsif (aux == "botonSum") then
		      	calc.botonSum
		      elsif (aux == "botonSus") then
		      	calc.botonSus
		      elsif (aux == "botonMul") then
		      	calc.botonMul
		      elsif (aux == "botonDiv") then
		      	calc.botonDiv
		      elsif (aux == "botonClear") then
		      	calc.botonClear
		      elsif (aux == "botonClearAll") then
		      	calc.botonClearAll
		      elsif (aux == "botonMemPlus") then
		      	calc.botonMemPlus
		      elsif (aux == "botonMemMinus") then
		      	calc.botonMemMinus
		      elsif (aux == "botonMemRec") then
		      	calc.botonMemRec
		      elsif (aux == "botonMemClear") then
		      	calc.botonMemClear
		      elsif (aux == "botonEqual") then
		      	calc.botonEqual
		      	client.puts(calc.respuesta)
		      elsif (aux == "exit") then
		      	client.close
		      else 
		      	client.puts("Error: non existent operation :(")
		      end
		    }
	end
end

server = Server.new