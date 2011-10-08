# Bach

In the later years of his life, Johann Sebastion Bach became increasingly
blind. His final works were dictated from his deathbed.

This project, Bach, provides text-to-speech as a service.


Up and running fast
-------------------

I've provided a Vagrant setup that will get you up and running fast. Install
the necessary gems using Bundler:

    $ cd /path/to/checkout/of/bach
    $ bundle

Ask Vagrant to bring up the server components for you:

    $ cd /path/to/checkout/of/bach
    $ bundle exec vagrant up

Ask Bach to translate a file full of text to an audio file:

    $ cd /path/to/checkout/of/bach
    $ bundle exec ./bin/bach < textfile > speech.mp3

That's it, text-to-speech with very little fuss.

Of course, if you want to use it as a real service on your network you'll
probably want to set it up a little differently. See the following sections on
Installing and Usage for information on how to setup your own text-to-speech
service.


Installing
----------

The server needs eSpeak and Lame installed. Mostly I do this using `apt-get`:

    $ apt-get install espeak lame

You'll need a broker that talks Stomp somewhere on your network. I use Apache
Apollo, and I'm not totally sure if the code uses anything that's specific to
that. I'd love it to be broker-agnostic though, so if you have patches that'll
bring this closer to reality please send them to me!


Usage
-----

Run the server, somewhere that has eSpeak and Lame installed:

    $ bachd --broker=stomp://mq.yourdomain.com:61613

Use the services on the command line. You don't need to have eSpeak
installed on your client machines, just Bach.

A brief example of what interacting with Bach looks like, here
converting the text of the Gettysberb address to an mp3:

    $ curl -O http://history.eserver.org/gettysburg-address.txt
    $ bach --broker=stomp://mq.yourdomain.com:61613 \
      < ./gettysburg-address.txt > ./gettysburg-address.mp3

I explicitly state the broker in the above commands but if you leave out that
option it'll default to stomp://localhost:61613 ie it expects a broker running
on your local machine if you don't tell it otherwise.


Authors
-------

Craig R Webster <http://barkingiguana.com/>
