Hello Sinatra
=============

Hello Sinatra is a barebones, classic-style [Sinatra](http://www.sinatrarb.com/) application that utilizes [Slim](http://slim-lang.com/) for templates, [Compass](http://compass-style.org/) (Sass) for CSS, and [MiniTest::Spec](http://bfts.rubyforge.org/minitest/) for testing.

Getting Started
---------------

Open up your favorite terminal emulator and...

    $ git clone git://github.com/elasticdog/hello-sinatra.git
    $ cd hello-sinatra/
    $ bundle install
    $ ruby my_app.rb

That will launch the app using WEBrick at [http://localhost.com:4567/](), so open up a browser and bask in all the "Hello world!" glory. You can press `Ctrl-C` to shut things down and get back to the command line.

To run the included tests:

    $ rake test

Getting Fancy
-------------

Assuming you want a bit more functionality than "Hello world!", here's how things are hooked together...

    hello-sinatra
    ├── Gemfile
    ├── Gemfile.lock
    ├── LICENSE
    ├── README.md
    ├── Rakefile
    ├── config.ru
    ├── my_app.rb
    ├── spec
    │   └── my_app_spec.rb
    ├── specs.watchr
    └── views
        ├── index.slim
        ├── layout.slim
        └── stylesheets
            └── style.scss

Make your application changes in `my_app.rb`, template changes under the `views/` directory, stylesheet changes under `views/stylesheets/`, and test changes under the `spec/` directory. There are a couple of extra files included to help automate the development process...

Automation
----------

For actually developing a new Sinatra app, you won't want to be stuck reloading WEBrick every time you make a change. Luckily, there are easy ways to automatically reload the appropriate files whenever you save your app.

You can use the [`watchr` gem](https://github.com/mynyml/watchr) along with the included `spec.watchr` file to run your tests automatically every time you update your app or tests (similar to ZenTest/autotest).

    $ watchr specs.watchr

**Note:** _Installing the `ruby-fsevents` gem will make Watchr more efficient by having the OS notify Watchr about new changes directly, rather than having it regularly poll the filesystem._

To automatically reload the development Rack server, there are a couple of possibilities...if you're on OS X, the [Pow](http://pow.cx/) project makes development extremely convenient (more so when adding the [`powder` gem](https://github.com/Rodreegez/powder) on top to manage things); or you can use the [`shotgun` gem](https://github.com/rtomayko/shotgun) to fork and reload the server on every request.

    $ shotgun config.ru

Using `shotgun` does make things a bit slow, but it's better than nothing.

License
-------
Copyright &copy; 2011, Aaron Bull Schaefer. Hello Sinatra is distributed under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
