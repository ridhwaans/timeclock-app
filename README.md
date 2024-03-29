# timeclock-app

### Setup
- in Terminal, `cd` to the root directory, and run `bundle install`
- run `rake db:create`, `rake db:schema:load` to create the database
- run `rails server`
- go to `localhost:3000`
- create an account to login and use

**Github** https://github.com/ridhwaans/timeclock-app  

**How did you approach this challenge?**  
I gathered the project requirements, and decided to build an MVC webapp with CRUD and a database component, utilizing ruby on rails. I broke down the bigger requirements into smaller problems, and designed a boilerplate code template and added on to it. 

**What schema design did you choose and why?**  
For the database schema design, three different tables to store and manage the application state. As the main feature is for users to clock in timesheets, the schema has one user to many clock events constraint, and one event to many clock in/outs. Passwords are stored as an encrypted hash, and other fields are also explicitly typed. Also used ActiveRecord to map objects, and clear naming across models and views. Didnt create unnecessary fields that would take up extra memory.

**If you were given another day to work on this, how would you spend it? What if you were given a month?**  
If I was given another time block, I would create more unit tests (and integration tests for between components) to improve the code coverage, reduce code smells. If I was given a month, I would setup a continuous integration and continuous deployment pipeline, if it wasnt established before, to improve the feedback loop between developer and stakeholders. If there is growth in traffic or high user load in the month, I would work on adding logging, consider scaling out the system design, load testing and caching for fast response, adding cloud monitoring etc.
