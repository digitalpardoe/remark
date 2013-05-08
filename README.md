Remark
======

Introduction
------------

Remark is a simple blogging tool.

Setup
-----

### Development

Download or clone and run the following commands:

	bundle install --without production
	bundle exec rake db:setup
	bundle exec rails s thin

Navigate to _http://localhost:3000/admin_ and login using the default credentials:

	admin
	password
	
Go to the _users_ tab and change your password (and username if you feel like it).

### Production

Download or clone, setup _config/database.yml_ (production mode defaults to MySQL) and run the following
commands:

	bundle install
	bundle exec rake db:setup RAILS_ENV=production

Navigate to _http://yourserver.com/admin_ and login using the default credentials:

	admin
	password
	
Go to the _users_ tab and change your password (and username if you feel like it).

Next Steps
----------

Start blogging.

License
-------

All of my code is licensed under the terms found in the LICENSE file, the license is essentially based
on the BSD new license but breaks down into the following points:

1. You can use the code wherever you wish.
2. You can modify the code as much as you want and use the modified code wherever you wish.
3. You can redistribute the original, unmodified code, but you have to include the full license text.
4. You can redistribute the modified code as you wish (without the full license text).
5. In all cases, you must include an attribution mentioning Alex Pardoe as the original creator of the source.
6. I’m not liable for anything you do with the code, no matter what. So be sensible.
7. You can’t use my name or other marks to promote your products based on the code.
