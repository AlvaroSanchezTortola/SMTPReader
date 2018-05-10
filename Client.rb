#!/usr/bin/ruby -w
$LOAD_PATH << '.'
require "mysql2"  

class Inbox
	attr_accessor :new, :selection
	def initialize
		puts "\n** Good day! Starting your inbox... **\n"
		@new = false
		@selection = 0
	end
	def printMainMenu
		puts "\n\n   1) View Messages \n   99) Quit \n\n"
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
			puts "\tMail from: #{row["from_"]} | Subject: #{row["subject"]} | #{row["content"]}"
		end

	end
end

def run
	inbox = Inbox.new
	@is_running = true
	while @is_running do
		inbox.printMainMenu
		opt_ = gets.chomp
		case opt_
		 when "1"
		 	inbox.dbConnection
		 
		 when "99"
		 	puts "** Thanks for using our service! :) **"
		 	@is_running = false
		 end 
	end
end

run