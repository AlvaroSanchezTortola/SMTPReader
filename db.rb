=begin
@AlvaroSanchez
Manage database conection.
=end
require "mysql2"
module DatabaseManager
	@db_host  = "localhost"
	@db_user  = "alvaro"
	@db_pass  = "toor"
	@db_name = "proyecto1"
	
	def self.getMails(which="ALL")
		client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)
		case which
		when "ALL"
			results = client.query("SELECT * FROM mails ORDER BY created_at DESC;")
			
		when "NEW"
			results = client.query("SELECT * FROM mails WHERE status=0 ORDER BY created_at DESC;")
		end
		client.close
		return results
	end
	def self.setMailRead(which="ALL")
		client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)
		case which
		when "ALL"
			client.query("UPDATE mails SET status = 1;")
		end
		client.close
	end
end