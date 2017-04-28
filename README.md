# BookGossip

BookGossip is an online platform for book readers to
  - Have Discussions on notable Books 
  - Publish Reviews of Books
  - Get Scoops of their Favorite Books & Authors

### Features List

  - User Roles set by User Types
  - Account Activation via Email
  - Clean, Materialistic Design
  - Intuitive & Interactivce UI
  - Calendar for Important Dates
  - Group Creation & Message Board/Forum
  - Profiles for ALL Models

### Built With:
  - **Telekinesis**
  - ... and also Ruby on Rails!

### Tech

BookGossip uses a number of open source projects to work properly:

* Ruby On Rails 5 - Awesome Web Framework that allows you to do so much!
* PostGreSQL - Database Management
* GitHub - Let this be the MOTHER of your app 
* JQuery - Just Enhance your app in ways unimaginable
* Twitter Bootstrap - A Solid Front End Design Framework 

#### Languages
To make this project I've primarily used
* Ruby (Ruby on Rails Framework is written with Ruby)
* HTML5 & CSS3
* JavaScript (JQuery Library, AJAX)
* SQL (Database Schema Design)

#### Tools
* SublimeText - Text Editor for everything
* GoogleChrome DevTools - Life saver for Front End Development

#### Environment
* Ubuntu - Working via Ubuntu, a Linux (Debian) based OS, has made tasks efficient and sensible.

#### Resources
* Stack Overflow 
* Wikipedia
* Numerous Tech Blogs (For specific tasks)
* Ruby on Rails Official Documentation
* JQuery Official Docs
* Heroku Official Documentation 

### Visit
#### <http://bookgossip.herokuapp.com>

### Todos
 - Write Tests

**Free For All, Oh Yeah!**

### Important
###### If you want to check out this project for development, **please follow these instructions first**.

1. Open **config/environments/development.rb**
2. On Line 60, under **config.action_mailer.smtp_settings** 
3. Find This 
    ```ruby
        user_name:  ENV["MAILER_EMAIL"],
        password:   ENV["MAILER_PASSWORD"]
    ```
   
4. Update Accordingly
    ```ruby
        user_name:  "your gmail username goes here",
        password:   "your gmail password goes here"
    ```
5. Save & Restart Server.
