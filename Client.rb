require 'socket'

hostname = 'localhost'
port = 2000

class Client
	def initialize( server )
		@server = server
		@request = nil
        @response = nil
		sendToServer
		receiveFromServer
		@request.join
        @response.join
	end
	def sendToServer
		@request = Thread.new do
		loop {
		    msg = $stdin.gets.chomp
		    @server.puts( msg )
		    }
		end
	end
	def receiveFromServer
		@response = Thread.new do
		loop {
		    msg = @server.gets
		    puts "#{msg}"
		    }
		end
	end
end

s = TCPSocket.open(hostname, port)
client = Client.new(s)
