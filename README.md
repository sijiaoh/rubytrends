# README

- Ruby version  
  See `.ruby-version`

- Database creation  
  `rails db:start` to create mysql in docker.

- Database initialization  
  `rails db:migrate`

- Run server.
  `./bin/dev`

- Run server with google analytics debug mode.
  `GA_MEASUREMENT_ID=a ./bin/dev`

- How to run the test suite  
  `./bin/test`

- Deployment instructions  
  TODO

- Notes  
  [For this reason][link_to_reason], do not use any method other than GET with link_to.

[link_to_reason]: https://qiita.com/jnchito/items/5c41a7031404c313da1f#destroy%E3%81%AE%E3%83%AC%E3%82%B9%E3%83%9D%E3%83%B3%E3%82%B9%E3%81%AB-status-see_other-%E3%82%92%E4%BB%98%E3%81%91%E3%82%8B%E5%BF%85%E8%A6%81%E3%81%8C%E3%81%82%E3%82%8B
