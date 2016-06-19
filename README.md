# NewlyWish Challenge

This is a tentative solution to the problem provided [here](./INSTRUCTIONS.md).

The goal was to create an admin dashboard to search through server logs of rails applications to measure browsing patterns and debug.

## Setup

Prerequisites(in order):

[Github](https://www.github.com)
[Ruby v2.2+](https://www.ruby-lang.org/en/documentation/installation/)(Ruby Version Manager Suggested)
[Bundler](http://bundler.io/)
[Rails](http://installrails.com/)
[MySql](http://brewformulas.org/Mysql)

Ruby and it's library manager, Bundler need to be installed prior to installing Rails.
MySQL should be running in order for Rails to work.

Simply clone this repository, or [view online here](https://nameless-beach-46209.herokuapp.com/)

After cloning, open your terminal, *navigate to the rails app folder*,run the following commands:

1. rake exec bundle install
1. rake exec rake db:create
1. rake exec rake db:setup
1. rake exec rake db:migrate

After the above commands, run:

1. rails s
1. navigate to `localhost:3000` in your web browser
1. hit `ctrl-c` to close the app

## The Approach

With an 8 hour time limit I didn't have a lot of time to get every feature created. I had to get back into code writing mode, and set up mysql. Many features are missing, but the experience was helpful to me for getting back into the groove of writing my own code.

I wanted to start with just monitoring the log of the current Rails app I was writing, before expanding to analyzing logs from other apps. I knew based on the `sample.log` file that I'd have to sign each server request with the UUID, and the bulk of my time would be spent parsing through said file.

I began by researching different ways to customize my rails log to get the UUID in there and came across [this tutorial](https://wearestac.com/blog/log-tagging-in-rails).
The next challenge was actually parsing the file. I began by going into `pry` to test out how to parse the file and the text to create an object with UUIDs and corresponding messages. There's some gross regexes in there, but nothing too crazy.

Then I set about displaying the logs just on a static page.

I started setting up ways for the code to work in production on heroku, which introduced some issues I'd have to address later.

After the initial code started working I refactored it, placing code where it made sense to me. The goal for my refactor was to make this as painless to integrate as possible to a live application.

My file parser is dynamic based on the environment the application is running in. Since it formats the logs for my view, I have it placed in the `log_helper.rb`

The admin page displays on the root page for simplicity, however the `log_controller` that manages it is actually nested in an `admin` namespace. You can check out the `/admin/logs/index` which is where you'd ideally hit it in a live setting. To test wht my production settings looked like I set up a `/admin/logs/raw/:env` route to show the raw text from the log files across environments.

I considered making this an angular SPA, so a json format option was added to the index route just for kicks, but time became an issue and at this point I had to stop. The last things I added were the migrations to manage logs and the requests in them. They had the following structure:

!(erd_diagram)[./log_erd.png]

Looking back a lot of my time was burnt doing research but I want to give an accurate picture of where I'm at right now.

## Things I'd Add
