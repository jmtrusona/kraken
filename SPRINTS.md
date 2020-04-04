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

# Sprint 8

March 28, 2020 from 3:45pm to 4:45pm

### Aloha

- move to [subcommands](https://github.com/erikhuda/thor/wiki/Subcommands) 

## Review

- run `bundle exec exe/kraken git whoami`
- run `bundle exec exe/kraken github tags`
- run `bundle exec exe/kraken kubernetes pods trusona` (connect to us-oahu cluster)
- run `bundle exec exe/kraken trello cards`

## Retro

- `+` refactor to subcommands went smoothly
- `+` less mess in the **kraken_spec.rb** file
- `-` the help on subcommands is a little weird
- `+` finished sprint early (only took 45 minutes)

# Sprint 9

March 29, 2020 from 7:00am to 8:00am

### List the releases in CHANGELOG.md

- parse the CHANGELOG.md file
- add `kraken changelog view` command
- output:
```
Version: 0.0.1
Added:
- New feature to thing
Updated:
- Refactored old thing to be better
...
```

## Review

- nothing, failed the sprint

## Retro

- `-` only got the parse logic for the CHANGELOG.md half done
- `+` got all the test logic set up for changelog
- `-` had to skip the broken tests to be able to merge to master
- `-` time spent on refactoring may have been reason for failure
- `+/-` output of the `kraken changelog view` command is "under construction" to keep it releasable
- `-` sprint ran over time (extra 15 minutes to get in releasable state)

# Sprint 10

March 29, 2020 from 7:00am to 8:00am

### List the releases in CHANGELOG.md

- parse the CHANGELOG.md file
- finish the `kraken changelog view` command
- output:
```
Version: 0.0.1
Added:
- New feature to thing
Updated:
- Refactored old thing to be better
...
```

## Review

- nothing, canceled the sprint

## Retro

- `-` failed the sprint due to interruption
- `+` fixed tests that were skipped after last failed sprint
- `+` added tests to make sure subcommands are listed
- `-` didn't get to finish `kraken changelog view` command logic
- `-` sprint only lasted 30 minutes due to interruption

# Sprint 11

March 31, 2020 from 6:00am to 7:00am

### List the releases in CHANGELOG.md

- parse the CHANGELOG.md file
- finish the `kraken changelog view` command
- output:
```
Version: 0.0.1
Changes:
- New feature to thing
- Refactored old thing to be better
...
```

## Review

- run `bundle exec exe/kraken changelog view`

## Retro

- `-` didn't quite finish getting the output done
- `+` actually finished the parsing logic
- `-` code is difficult to read (but works)
- `-` will need to iterate on the feature again

# Sprint 12

March 31, 2020 from 9:00am to 10:00am

### List the releases in CHANGELOG.md

- finish parsing the CHANGELOG.md file
- finish the `kraken changelog view` command
- output:
```
Version: 0.0.1
Changes:
- New feature to thing
- Refactored old thing to be better
...
```
- Rename wrapper to service
- Update mock approach to simplify calling the services

## Review

- run `bundle exec exe/kraken changelog view`

## Retro

- `+` output of the `changelog view` command finally has the changes in it
- `-` tried to build out a skeleton class for handling the parsing which was too much
- `-/+` sprint was interrupted by breakfast :)
- `+` fit in some refactoring to simplify command signatures