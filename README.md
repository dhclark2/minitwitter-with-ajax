# README

- Add a "search" input in a form to the navbar of your twitter app
- After each keypress, submit an ajax request to your tweet index page, including the search text.
  - Update the index action to look for a search param (that your form sends)
  - If present, filter all the tweets to just those that include that term (use the database to do this with a LIKE clause)
  - Render some javascript that replaces your list of tweets on the page with the found tweets
- This will be very much like our in-class example but instead of a drop down it is on an input field
- Look into debouncing so we aren't doing searches on every keypress, but only when the user stops typing for a moment.


X Our Twitter does not support multiple users (yet)
- Reimplement a single user's Twitter timeline with a Bootstrap / The Iron Yard flare.
X Make the root page be the list of tweets
    [COMPLETELY ignore rewtweets, favorites, replies, images, etc.]
X Tweets should be shown in the order of most currently posted first
X Use scaffold to create a tweet model that includes
    X text (limit it to 140 characters, e.g. reject any Tweet that has more than 140 characters)
    X user_name
    X created_at (NOTE: You get this for free from scaffolds)
X Implement a link to post a new tweet in the nav header. This should allow the user to submit a new tweet

X Fill in some tweets (bonus points if you use learn how to use seeds via db/seeds.rb -- see the rails guides)
X Don't allow a tweet without text or a user (See validations in the Rails Guides)

- If the text of a tweet starts with http:, instead of showing the text as plain text, show it as a link.
(e.g. if the tweet is http://google.com then the tweet text should be http://google.com but be a link to that URL.)
TOP TIP: You'll need an if/else condition in your view, and use link_to
