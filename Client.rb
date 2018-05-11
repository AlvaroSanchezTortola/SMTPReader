#!/usr/bin/ruby -w
$LOAD_PATH << '.'
require "Inbox"  

def run
	inbox = Inbox.new
	@is_running = true
	while @is_running do
		inbox.printMainMenu
		opt_ = gets.chomp
		case opt_
		when "1"
		 	inbox.showNewMessages
		when "2"
		 	inbox.showAllMessages
		when "99"
		 	puts "** Thanks for using our service! :) **"
		 	@is_running = false
		else
		 	puts "ERROR: Invalid option, try again!\n"
		end 
	end
end

run