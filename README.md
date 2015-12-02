# README
This is an OAuth 2.0 demo app, based on the Stuk.io Codecast at
https://www.youtube.com/watch?v=11BInedaQSo

## MODIFICATIONS
* does not support Facebook OAuth
* added Heroku support (see Gemfile)
* added [Figaro gem](https://github.com/laserlemon/figaro) to administrate
  application secrets

## MANUAL
* run `bundle install` to install gems
* generate application secrets with `rake secret` and copy to
  `rename_to_application.yml`
* set callback URLs for registered application on GitHub, Twitter to correct
  URL. When running locally, you can use `http://lvh.me` as callback URL in case
  `http://localhost` is not allowed by the provider.
* copy/paste OAuth keys from GitHub, Twitter
* rename file to `application.yml` for Figaro support
* start local Rails server with `rails s` and navigate to
  `http://localhost:3000` in browser or `http://lvh.me:3000` when using
  `lvh.me` as callback.

**For Heroku deployment**
* `heroku login` on command line
* `heroku create app-name` - note down your application's URL
  (`app-name.herokuapp.com`)
* `git push heroku master`
* set Heroku environment variables via Figaro: `figaro heroku:set -e
  production`
* update OAuth callback URLs on GitHub, Twitter to
  `app-name.herokuapp.com`
* `heroku restart` on command line
