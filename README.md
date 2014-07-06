WhatYouSaY
======

[![Code
Climate](https://codeclimate.com/github/freddyrangel/whatyousay.png)](https://codeclimate.com/github/freddyrangel/whatyousay)


WhatYouSay is the result of a conversation with friends over the meaning of
several Peruvian slang words and realizing there isn't a Spanish version of
UrbanDictionary. So we decided to work on one.

###How to Contribute:

It's still a work in progress so contributions are welcome. You can contribute
in a number of ways. For example, you might:

* Translating content into Spanish
* Improving design
* Submitting bug reports
* Add documentation and "how-to" articles to README or wiki
* Refactor existing code
* Build new features or extend current ones
* Fix bugs on the issue tracker
* Propose new features on the issue tracker

When contributing:

* Please let us know what you plan in the issue tracker so we can provide
  feedback
* Provide tests and documentation whenever possible. When fixing a bug, provide
  a failing test case that your patch solves
* Open a pull request and we'll review it as soon as possible.

###Installation:

After cloning this repo, don't forget to run the following:

```console
bundle install
rake db:migrate
```

You'll need NPM and Bower installed in order to fire up the server for Angular.

```console
curl -L https://npmjs.org/install.sh | sh
npm install -g bower
```

Finally, use Foreman to fire up the Rails and Angular servers:

```console
foreman start
```
