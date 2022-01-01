# README

This README would normally document whatever steps are necessary to get the
application up and running.

- Ruby version  
  See `.ruby-version`

- Database creation  
  `rails db:start` to create mysql in docker.

- Database initialization  
  `rails db:migrate`

- How to run the test suite  
  `./bin/test`

- Deployment instructions  
  TODO

- Notes  
  [For this reason][link_to_reason], do not use any method other than GET with link_to.

## Template usage

This project is rails project template.

Create your project.

```
git clone https://github.com/sijiaoh/ellie.git your_project_name
cd your_project_name
bundle install
./bin/rake 'rename_project[your_project_name]'
git add --all
git commit -m 'Rename project.'
git remote set-url origin your_repository_url
git push origin main
```

Update.

```
git remote add ellie https://github.com/sijiaoh/ellie.git
git fetch ellie
git merge ellie/main
```

[link_to_reason]: https://qiita.com/jnchito/items/5c41a7031404c313da1f#destroy%E3%81%AE%E3%83%AC%E3%82%B9%E3%83%9D%E3%83%B3%E3%82%B9%E3%81%AB-status-see_other-%E3%82%92%E4%BB%98%E3%81%91%E3%82%8B%E5%BF%85%E8%A6%81%E3%81%8C%E3%81%82%E3%82%8B
