#!/usr/bin/ruby -w
$LOAD_PATH << '.'
require "mysql2"  

class Inbox
	attr_accessor :new
	def initialize
		puts "** Good day! Starting your inbox... **"
		@new = false
	end
	def printMainMenu
		puts "

		"
	end
	def dbConnection(mode="r",message="")
		db_host  = "localhost"
		db_user  = "alvaro"
		db_pass  = "toor"
		db_name = "mails"

		client = Mysql2::Client.new(:host => db_host, :username => db_user, :password => db_pass, :database => db_name)
		results = client.query("SELECT * FROM mail;")
		# puts @results.count
		client.close
		results.each do |row|
			puts row["id"]
		end
	end
end

def run
	inbox = Inbox.new
	@is_running = true
	while @is_running do
		inbox.dbConnection()
		@is_running = false
	end
end

run