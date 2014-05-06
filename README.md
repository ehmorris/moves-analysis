#### Setup
* Go to [https://accounts.moves-app.com/export](https://accounts.moves-app.com/export) and download the zip archive
* Unzip the archive, then unzip the csv archive within the `moves_export` folder
* Copy the `csv > full > places.csv` file into this app's `public` folder
* Run `bundle install`, `rake db:create`, and `rake db:migrate`
* Run `rake parse_csv:populateDatabase` to convert `public/places.csv` to a postgres database
* Run the server with `rails s`
