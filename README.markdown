Remark
======

Introduction
------------

Remark is an easy to install, easy to use blogging engine.

Setup
-----

Download, clone and run the following commands:

	rake remark:setup:db[ _sqlite3 / mysql_ ]
	bundle install
	rake db:migrate RAILS_ENV=production
	rake db:seed RAILS_ENV=production

Navigate to _http://yousite.com/admin_ and login using the default credentials:

	admin
	password
	
Go to the _users_ tab and change your password (and username if you feel like it).

Next Steps
----------

Start blogging.
