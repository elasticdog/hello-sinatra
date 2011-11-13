Hello Sinatra
=============

Hello Sinatra is a barebones, classic-style [Sinatra](http://www.sinatrarb.com/) application that utilizes Ruby 1.9.x, [Bundler](http://gembundler.com/) for managing dependencies, [Slim](http://slim-lang.com/) for templates, [Compass](http://compass-style.org/) (Sass) for CSS, and [MiniTest::Spec](http://bfts.rubyforge.org/minitest/) for tests.

It is meant to be a blank slate that will give you a head start when developing your own application with this specific technology stack.

Getting Started
---------------

Open up your favorite terminal emulator and...

    $ git clone git://github.com/elasticdog/hello-sinatra.git
    $ cd hello-sinatra/
    $ bundle install
    $ ruby my_app.rb

That will launch the app using WEBrick at [http://localhost.com:4567/](), so open up a browser and bask in all the "Hello world!" glory. You can press `Ctrl-C` back in the terminal to shut things down and get back to the command prompt.

To run the included tests:

<pre>$ rake test                 <i># run tests normally</i>
$ rake test TESTOPTS="-v"   <i># run in verbose mode</i></pre>

Getting Fancy
-------------

Assuming you want a bit more functionality than "Hello world!", here's how things are hooked together...

    hello-sinatra/
    ├── Gemfile
    ├── Gemfile.lock
    ├── LICENSE
    ├── README.md
    ├── Rakefile
    ├── config.ru
    ├── my_app.rb
    ├── spec/
    │   └── my_app_spec.rb
    ├── specs.watchr
    └── views/
        ├── index.slim
        ├── layout.slim
        └── stylesheets/
            └── style.scss

Make your application changes in `my_app.rb`, template changes under the `views/` directory, stylesheet changes under `views/stylesheets/`, and test changes under the `spec/` directory. Create a top-level `lib/` directory for any additional Ruby modules you want to include, and a `public/` directory for static files.

Automation
----------

For actually developing a new Sinatra app, you won't want to be stuck manually reloading WEBrick and running `rake test` every time you make a change. Luckily, there are ways to automate reloading the appropriate services whenever you save your app.

To automatically reload the development Rack server, there are a couple of possibilities...if you're on OS X, the [Pow](http://pow.cx/) project makes local development extremely convenient (more so when adding the [`powder` gem](https://github.com/Rodreegez/powder) on top as a command-line wrapper); or you can use the [`shotgun` gem](https://github.com/rtomayko/shotgun) to fork and reload the server on every request.

    $ shotgun config.ru

To automatically run your tests, you can use the [`watchr` gem](https://github.com/mynyml/watchr) along with the included `specs.watchr` file. This is similar to using ZenTest/autotest, but a bit more flexible.

    $ watchr specs.watchr

**Note:** _Installing the `ruby-fsevents` gem makes things more efficient by having the OS notify Watchr about new changes directly, rather than having it regularly poll the filesystem._

Contribute
----------

Have ideas on how to make Hello Sinatra better? Great! Just [fork the project](http://help.github.com/fork-a-repo/), create a new branch, make your changes, push them back, and [send a pull request](http://help.github.com/send-pull-requests/).

License
-------

Copyright &copy; 2011, Aaron Bull Schaefer. Hello Sinatra is distributed under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
