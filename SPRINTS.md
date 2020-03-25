# Sprint 1 

March 21, 2020 from 11:00am to 12:00pm

## Stories

### List kubernetes deployment

- add kubernetes client gem
- add `kraken list deployments [name]`
- ~ validate the name is found in cluster
- output:

```
[deployment name] - [cluster]
- [pod] : [status]
- [pod] : [status]
```

- `v0.2.0` tagged
- fully tested using live cluster
- ~ stub out kubernetes cluster

## Review

- run `bundle exec exe/kraken pods trusona`
- run `bundle exec exe/kraken pods td-authentication`


## Retro

- `+` Switched from `list deployment` to `pods` 
- `+` Changelog is descriptive and easy to update
- `+` Finished the idea of listing the deployment in an hour
- `-` Tests are brittle as they rely on the current us-oahu pods names for Trusona Service
- `-/+` The original gem I was planning on using ended up being too limited to be useful, switched to use `https://github.com/kontena/k8s-client` instead

# Sprint 2

March 21, 2020 from 2:00pm to 3:00pm

### List Trello cards

- add tacokit gem
- add `kraken cards` command
- output:

```
Backlog
- [card number] : [card title]
- [card number] : [card title]
Sprint Backlog
- [card number] : [card title]
...
```

- `v0.3.0` tagged

## Review

- Nothing to review, failed to complete task and deleted sprint code

## Retro

- `-` tacokit gem did not end up working as planned, switched to trello-ruby gem
- `-` unable to complete tasks with the sprint, rolled back all code
- `+` able to generate the app key and member key secrets
- `-` got lost in writing the spec code, wasted too much time
- `+` was able to list the cards by lists
- `+/-` try again from scratch in next sprint, no release, no `v0.3.0`

# Sprint 3

March 22, 2020 from 10:00am to 11:00am

### Add watch to pods command

- add `--watch` flag to `kraken pods` 
- output:

```
Pod [app label]
- [pod] : [status] -> 5min 
- [pod] : [status] -> 1m32s
```

- update tests to use mock
- `v0.4.0` tagged

## Review

- run `bundle exec exe/kraken pods trusona`
- run `bundle exec exe/kraken pods td-authentication`
- tests no longer rely on real kubernetes cluster
- released as `v0.3.0`

## Retro

- `-/+` scrapped the watch command idea to focus on tests
- `+` no longer need real cluster to run tests
- `-` watch command provides little value as you can just use the `watch kraken pods trusona` for the same effect

# Sprint 4

March 22, 2020 from 12:00pm to 1:00pm

### List github tags

- add octokit gem
- add GithubWrapper to project
- add `kraken tags` command, looks up tags for current directory project (must run from with project)
- output:

```
Github Tags
- v0.1.0
- v0.2.0
```

- Tests use mock
- `v0.4.0` tagged

## Review

- run `bundle exec exe/kraken tags` which lists the jmtrusona/kraken tags
- run `bundle exec exe/kraken tags --repository stubby-rails` which lists the jmtrusona/stubby-rails tags

## Retro

- `-` broke the spec right at the end of the sprint trying to add the repo and org flags
- `+` got the client wrapper working with tests
- `-` issues with pagination when pulling the tags, unable to run against skylab
- `-` did not have time to use current directory as the basis for tags, hard coded to this repo

# Sprint 5

March 22, 2020 from 2:00pm to 3:00pm

### List github tags

- add tacokit gem
- add TrelloWrapper to project
- add `kraken cards` command to list the Build board cards
- output:

```
Build
Backlog
- 2500 : Build a new thing
Sprint Backlog
- 2560 : Build this other thing
...
```

- Tests use mock
- `v0.5.0` tagged

## Review

- run `bundle exec exe/kraken cards` to display all card titles for the Build board

## Retro

- `-` feature did not turn out as planned
- `-` took extra 8 minutes to finish the sprint work
- `-` tried to use tacokit gem again which is old, waste of time
- `-` the Trello module is a bad name as it was clashing with the trello-ruby gem
- `+` got it sort of working
- `-` been forgetting to update the `version.rb` file with releases

# Sprint 6

March 22, 2020 from 4:30pm to 5:30pm

### Aloha

- fix module name
- remove `kraken hello` command
- add `kraken version` command
- refactor for outputs
- `v0.6.0` tagged

## Review

- run `bundle exec exe/kraken tags`
- run `bundle exec exe/kraken cards`
- run `bundle exec exe/kraken pods trusona`

## Retro

- `+` nice to clean up code
- `-` no new features


# Sprint 7

March 25, 2020 from 7:00am to 8:00am

### Figure out git repo based off current directory

- add a git gem to project
- add `kraken whoami` command

## Review

- run `bundle exec exe/kraken whoami`

## Retro

- `-` had to fix tests that were left broken in Sprint 6
- `-/+` removed the faker classes which were not being used
- `+` git service was easy to implement
- `+` finished the sprint early (only took 40 minutes)