# Play-Me
**This App is currently in progress**
**Please see the Goals section for insights into where this app is headed**

##This application was designed to utilize the OpenDota API in conjunction with the Steam API to allow users to login to their steam account and receive insight into the Hero selection process in order to enhance the user experience.##

##Inspiration for this project, and some of this project's goals, come from the OpenAI Five project.  OpenAI Five is a project currently being worked on by OpenAI to use the game of Dota2 to show 'that current AI algorithms can learn long-term planning with large but achievable scale.'  Learn more about OpenAI Five at openai.com/five/##

*This app can be found hosted at https://hero-picker.herokuapp.com/*

###This app is, currently, relatively simple.  Using Steam OAuth, a user can login with their steam account, which grants the app access to their Steam ID.  This Steam ID is used by the app to gain access to the user's performance metrics in the game of Dota2 on the OpenDota API.  Using the OpenDota API, the app creates a database of Heroes, of which their are 116 in the game of Dota2.###
###Using the data on the API, the app gives each of these Heroes a default score based on the current popularity of the Hero at the professional level and the current win-rate of the Hero across all levels.  Each user also has a score for each Hero as determined by the app based on their metrics for each hero, including the number of times they have played the hero to get an idea for experience, and the user's win-rate on the hero across those games.  The app will then combine the default score for each hero with the user's score on each hero to create a score that represents how 'good' that hero is currently in the game of Dota2 as played by that user.###
###The app currently uses these scores to create a collection of the top heroes as played by that user and returns one at random as a suggestion for the user to play.  The app also has two other categories, one is designed to give the user a 'fun' pick, which uses the heroes scores alongside a user setting for selecting what heroes they find fun to allow the user to restrict the overall pool of heroes down to those of their own choosing, and then the app runs the same process of finding those with the highest scores for the user and returns one of them.  The other category is 'random', this allows a user to select a pool of heroes from which the app will generate a completely random hero.  The rationale for the random category stems from the inability of the user to do something like this in the game of Dota2 at the moment, where random is only random out of every hero in the game, including those that the user may not know how to play.###

- To run this app locally, in the terminal, run the command `git clone git@github.com:LucasAlderfer/PlayMe.git`

- Once this app has been cloned locally, change directories into the project and run from the terminal:
  - `bundle install`
  - `bundle update`
  - `rake db:{create,migrate}`
  - `rake setup`
    - Please be patient the `rake setup` command takes 3 minutes to run and makes many API calls.
  - `figaro install`

- Once those commands have been run, the user will need a SteamAPI key.  Directions for obtaining a SteamAPI key can be found here: https://steamcommunity.com/dev/apikey, and conditions for use can be found here: http://steamcommunity.com/dev/apiterms

- The command `figaro install` which was run as the last part of the required commands should have created an application.yml file in the /config directory.  Once you have obtained a Steam API Key, please insert this line into your application.yml:
STEAM_API_KEY: <YOUR API KEY HERE>
  - Please note, this naming convention is strict, it must be named STEAM_API_KEY in the format provided, with a colon, then 1 single space, then your API key as provided by steam, not in quotes.  I believe it is 32 characters.

- Testing for this application is run using RSPEC, and the terminal command `rspec` will run the test suite.  By default the test located in /spec/features/user_can_login_spec.rb is skipped.  This test sets up a database again from scratch and tests the process of the app on boot-up from a login to a user seeing their main page, it takes several minutes to run.  It can be un-skipped by removing the 'x' located at the start of line 5 in that file.
  - Test coverage when this test is unskipped should be at 94% according to SimpleCov.

# GOALS #

###This applications efficiency and runtimes are being measured using NewRelic and will continuously be improved###

###This application aims to be more situationally effective, allowing users to enter the heroes that have been selected on the other team and on their own to be entered.  The data for each hero playing with and against other heroes is already available, but the evaluation metrics are not yet completed.  I plan to use 4 drop-down fields for other heroes on the user's team, and 5 for the opposing team, and JQuery to enter the heroes into the metrics.###
###The application should ultimately be using a machine learning algorithm to get better at its statistical recommendations based on matchups of heroes on the same team and the opposing team by looking at more than just basic wins and losses with and against, but making comparisons of wins and losses with collections of heroes.###
