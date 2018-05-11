#!/usr/bin/ruby -w
$LOAD_PATH << '.'
require "db"  

class Inbox
	include DatabaseManager;
	attr_accessor :new, :selection
	def initialize
		puts "\n** Good day! Starting your inbox... **\n"
		@new = false
		@selection = 0
	end
	def printMainMenu
		puts "\n\n   1) View New Messages (new) \n   2) View All Messages \n   99) Quit \n\n"
	end
	def printMessages(results)
		puts "--------------------------------------------------------------------------------------------\n\n"
		unless results.count == 0 then
			results.each do |row|
				puts "\tMail from: #{row["from_"]} | Subject: #{row["subject"]} | #{row["content"]}"
			end
		else
			puts "\t*** No new messages! Come back later. ***\n"
		end
		puts "\n--------------------------------------------------------------------------------------------"
	end
	def showNewMessages()
		results = DatabaseManager.getMails("NEW")
		DatabaseManager.setMailRead
		printMessages(results)
	end
	def showAllMessages()
		results = DatabaseManager.getMails
		printMessages(results)
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