Vestibule
=========

This is the simple application that we used to build [Ruby Manor](http://rubymanor.org/) numbers [3](http://rubymanor.org/3/) and [4](http://rubymanor.org/4/). It's simple purpose is to collect talk proposals, and try to channel feedback and suggestions on those proposals into *useful forms*.

What do we consider to be *non-useful forms*? Any feedback that hasn't thoughtfully considered the proposal and tried to improve it. To put it bluntly, ["+1" is the Anti-Christ][plus-ones].


How to contribute
-----------------

Fork, patch, test, send a pull request. Apologies that the code and design are bit rough. Perhaps you can make it better?


Build Status
------------

[![Build Status](https://travis-ci.org/rubymanor/vestibule.png?branch=master)](http://travis-ci.org/rubymanor/vestibule)

[Ruby Manor 3]: http://rubymanor.org/3
[plus-ones]: http://interblah.net/regarding-plus-ones


Launching locally
-----------------
1. Launch postgres

	```pg_ctl -D /usr/local/var/postgres/ -l /usr/local/var/postgres/server.log start```

2. Create the postgre users/dbs if needed

3. Launch rake

	```bundle exec rake```

4. Migrate the tables

	```bundle exec rake db:migrate```

5. Launch foreman

	```COOKIE_SECRET='5563022c166aae00f2c39151fdd4eaca' GITHUB_KEY='CHANGEME' GITHUB_SECRET='CHANGEME' foreman start```