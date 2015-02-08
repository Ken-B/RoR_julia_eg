This example shows a way to connect a Ruby on Rails web application with julia through ZMQ.

Basically we create a ZMQ server in julia that will perform some predefined calculation as instructed from a web page.

## installation

I write this on Ubuntue 14.04. If you are using another platform, you will have to google some installation procedures yourself.

To install Ruby on Rails, the easiest is using [rvm](http://rvm.io):

	curl -sSL https://get.rvm.io | bash -s stable --rails

I prefer working with a PostgreSQL database, but I assume this example to work fine with the standard MySQL. Install PostgreSQL on ubuntu (I know libpq-dev is necessary, the others I don't know):

	sudo apt-get install postgresql-client pgadmin3 postgresql postgresql-contrib libpq-dev

Of course you need julia installed. I used v0.3 for this example. See details on julialang.org. In julia you need to add the ZMQ package by simple `Pkg.add("ZMQ")`.

Once you download this example you should install the necessary gems listed in the gem file:

	git clone https://github.com/Ken-B/RoR_julia_eg
	cd RoR_julia_eg
	bundle install

## follow along

I'll try to commit the outcome of each rails command and describe it in the commit message.