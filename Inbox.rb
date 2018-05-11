#!/usr/bin/ruby -w
$LOAD_PATH << '.'
require "DB"  

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