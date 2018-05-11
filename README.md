# SMTPReader
![Ruby - Version](https://img.shields.io/badge/ruby-2.3.3-red.svg) ![Gems](https://img.shields.io/badge/gems-1-yellowgreen.svg)

This proyect provides a simple mail inbox, connected to a database. It is connected to [this server](https://github.com/AlvaroSanchezTortola/SMTPServer), [this client](https://github.com/AlvaroSanchezTortola/SMTPClient) and [this logger](https://github.com/AlvaroSanchezTortola/SMTPLogger). 

## Installation
### General Instructions
#### Ruby
First, install `Ruby`:
``` sh
sudo apt-get install ruby-full
sudo apt-get install ruby2.5-dev
```
then, install all `mysql-ruby` dependencies:
``` sh
sudo apt-get install libmariadbclient-dev
```
finally, install the gem for `mysql` connection:
``` sh
sudo gem install mysql2
```
## Run
Assuming you run it from a terminal within the main folder:
``` sh
ruby Client.rb
```
