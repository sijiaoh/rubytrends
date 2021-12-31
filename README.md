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
  As the system test does not seem to support the turbo_method option, button_to is used for requests other than GET.

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
