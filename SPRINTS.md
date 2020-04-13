# Sprint 1 

March 21, 2020 from 11:00am to 12:00pm

## Sprint Backlog

### List kubernetes deployment

- Add kubernetes client gem
- Add `kraken list deployments [name]`
- ~ Validate the name is found in cluster
- Output:
```
[deployment name] - [cluster]
- [pod] : [status]
- [pod] : [status]
```

- `v0.2.0` tagged
- Fully tested using live cluster
- ~ Stub out kubernetes cluster

## Review

- Run `bundle exec exe/kraken pods trusona`
- Run `bundle exec exe/kraken pods td-authentication`


## Retro

- `+` Switched from `list deployment` to `pods` 
- `+` Changelog is descriptive and easy to update
- `+` Finished the idea of listing the deployment in an hour
- `-` Tests are brittle as they rely on the current us-oahu pods names for Trusona Service
- `-/+` The original gem I was planning on using ended up being too limited to be useful, switched to use `https://github.com/kontena/k8s-client` instead

# Sprint 2

March 21, 2020 from 2:00pm to 3:00pm

## Sprint Backlog

### List Trello cards

- Add tacokit gem
- Add `kraken cards` command
- Output:
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

## Sprint Backlog

### Add watch to pods command

- Add `--watch` flag to `kraken pods` 
- Output:
```
Pod [app label]
- [pod] : [status] -> 5min 
- [pod] : [status] -> 1m32s
```

- Update tests to use mock
- `v0.4.0` tagged

## Review

- Run `bundle exec exe/kraken pods trusona`
- Run `bundle exec exe/kraken pods td-authentication`
- Tests no longer rely on real kubernetes cluster
- Released as `v0.3.0`

## Retro

- `-/+` scrapped the watch command idea to focus on tests
- `+` no longer need real cluster to run tests
- `-` watch command provides little value as you can just use the `watch kraken pods trusona` for the same effect

# Sprint 4

March 22, 2020 from 12:00pm to 1:00pm

## Sprint Backlog

### List github tags

- Add octokit gem
- Add GithubWrapper to project
- Add `kraken tags` command, looks up tags for current directory project (must run from with project)
- Output:
```
Github Tags
- v0.1.0
- v0.2.0
```

- Tests use mock
- `v0.4.0` tagged

## Review

- Run `bundle exec exe/kraken tags` which lists the jmtrusona/kraken tags
- Run `bundle exec exe/kraken tags --repository stubby-rails` which lists the jmtrusona/stubby-rails tags

## Retro

- `-` broke the spec right at the end of the sprint trying to add the repo and org flags
- `+` got the client wrapper working with tests
- `-` issues with pagination when pulling the tags, unable to run against skylab
- `-` did not have time to use current directory as the basis for tags, hard coded to this repo

# Sprint 5

March 22, 2020 from 2:00pm to 3:00pm

## Sprint Backlog

### List github tags

- Add tacokit gem
- Add TrelloWrapper to project
- Add `kraken cards` command to list the Build board cards
- Output:
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

- Run `bundle exec exe/kraken cards` to display all card titles for the Build board

## Retro

- `-` feature did not turn out as planned
- `-` took extra 8 minutes to finish the sprint work
- `-` tried to use tacokit gem again which is old, waste of time
- `-` the Trello module is a bad name as it was clashing with the trello-ruby gem
- `+` got it sort of working
- `-` been forgetting to update the `version.rb` file with releases

# Sprint 6

March 22, 2020 from 4:30pm to 5:30pm

## Sprint Backlog

### Aloha

- Fix module name
- Remove `kraken hello` command
- Add `kraken version` command
- Refactor for outputs
- `v0.6.0` tagged

## Review

- Run `bundle exec exe/kraken tags`
- Run `bundle exec exe/kraken cards`
- Run `bundle exec exe/kraken pods trusona`

## Retro

- `+` nice to clean up code
- `-` no new features


# Sprint 7

March 25, 2020 from 7:00am to 8:00am

## Sprint Backlog

### Figure out git repo based off current directory

- Add a git gem to project
- Add `kraken whoami` command

## Review

- Run `bundle exec exe/kraken whoami`

## Retro

- `-` had to fix tests that were left broken in Sprint 6
- `-/+` removed the faker classes which were not being used
- `+` git service was easy to implement
- `+` finished the sprint early (only took 40 minutes)

# Sprint 8

March 28, 2020 from 3:45pm to 4:45pm

## Sprint Backlog

### Aloha

- Move to [subcommands](https://github.com/erikhuda/thor/wiki/Subcommands) 

## Review

- Run `bundle exec exe/kraken git whoami`
- Run `bundle exec exe/kraken github tags`
- Run `bundle exec exe/kraken kubernetes pods trusona` (connect to us-oahu cluster)
- Run `bundle exec exe/kraken trello cards`

## Retro

- `+` refactor to subcommands went smoothly
- `+` less mess in the **kraken_spec.rb** file
- `-` the help on subcommands is a little weird
- `+` finished sprint early (only took 45 minutes)

# Sprint 9

March 29, 2020 from 7:00am to 8:00am

## Sprint Backlog

### List the releases in CHANGELOG.md

- Parse the CHANGELOG.md file
- Add `kraken changelog view` command
- Output:
```
Version: 0.0.1
Added:
- New feature to thing
Updated:
- Refactored old thing to be better
...
```

## Review

- Nothing, failed the sprint

## Retro

- `-` only got the parse logic for the CHANGELOG.md half done
- `+` got all the test logic set up for changelog
- `-` had to skip the broken tests to be able to merge to master
- `-` time spent on refactoring may have been reason for failure
- `+/-` output of the `kraken changelog view` command is "under construction" to keep it releasable
- `-` sprint ran over time (extra 15 minutes to get in releasable state)

# Sprint 10

March 29, 2020 from 7:00am to 8:00am

## Sprint Backlog

### List the releases in CHANGELOG.md

- Parse the CHANGELOG.md file
- Finish the `kraken changelog view` command
- Output:
```
Version: 0.0.1
Added:
- New feature to thing
Updated:
- Refactored old thing to be better
...
```

## Review

- Nothing, canceled the sprint

## Retro

- `-` failed the sprint due to interruption
- `+` fixed tests that were skipped after last failed sprint
- `+` added tests to make sure subcommands are listed
- `-` didn't get to finish `kraken changelog view` command logic
- `-` sprint only lasted 30 minutes due to interruption

# Sprint 11

March 31, 2020 from 6:00am to 7:00am

## Sprint Backlog

### List the releases in CHANGELOG.md

- Parse the CHANGELOG.md file
- Finish the `kraken changelog view` command
- Output:
```
Version: 0.0.1
Changes:
- New feature to thing
- Refactored old thing to be better
...
```

## Review

- Run `bundle exec exe/kraken changelog view`

## Retro

- `-` didn't quite finish getting the output done
- `+` actually finished the parsing logic
- `-` code is difficult to read (but works)
- `-` will need to iterate on the feature again

# Sprint 12

March 4, 2020 from 9:00am to 10:00am

## Sprint Backlog

### List the releases in CHANGELOG.md

- Finish parsing the CHANGELOG.md file
- Finish the `kraken changelog view` command
- Output:
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

- Run `bundle exec exe/kraken changelog view`

## Retro

- `+` output of the `changelog view` command finally has the changes in it
- `-` tried to build out a skeleton class for handling the parsing which was too much
- `-/+` sprint was interrupted by breakfast :)
- `+` fit in some refactoring to simplify command signatures

# Sprint 13

April 4, 2020 from 11:30am to 12:30pm

## Sprint Backlog

### Create GitHub Release

- Move `kraken github tags` to `kraken git tags`
- Add `kraken github create:release` command
- Asks for the Trello release card number
- Asks for the changes in the release
- Asks for confirmation


## Review

- Run `bundle exec exe/kraken github release` and verify a draft release was created at https://github.com/jmtrusona/kraken/releases
- Run `bundle exec exe/kraken github release --card=123` and verify a draft release was created at https://github.com/jmtrusona/kraken/releases
- Run `bundle exec exe/kraken git tags`

## Retro

- `+` working github release command
- `-` went over time by 15 minutes
- `-` not basing the release off the current directory yet
- `+` had time to move the git tags logic to the git service instead of github service

# Sprint 14

April 4, 2020 from 2:30pm to 3:30pm

## Sprint Backlog

### Aloha

- Setup gem publish

## Review

- README.md for installing and publishing the `kraken` gem

## Retro

- `-` not super happy with the install requiring the version
- `+` baby steps closer to getting a tool that is actually distributed
- `+` finished on time some how

# Sprint 15

April 11, 2020 from 10:00am to 11:00am

## Sprint Backlog

### Specific changelog changes

- Update the `kraken changelog view` command to break out changes by type
- Output:
```
Version: 0.0.1
Released: October 10, 2010
Added:
- New feature to thing
Changed:
- Refactored old thing to be better
Removed:
- Cleaned up unused class
...
```
- Add support for Unreleased

## Review

- Run `bundle exec exe/kraken changelog view`

## Retro

- `+` finished 10 minutes early
- `+` fixing the unreleased support went quickly and was easy
- `-` didn't follow strict TDD
- `+` test still drove the development
- `-` need a better release process now that I can publish to Artifactory

# Sprint 16

April 11, 2020 from 11:30am to 12:30pm

## Sprint Backlog

### Aloha

- Add the concept of Log to hold the header, releases and reference portions of the CHANGELOG.md 

## Review

- Nothing

## Retro

- `+` started the implementation for generating the changelog markdown
- `-` tried to add the project to project to the markdown for generating links which caused too much stuff to break
- `+` liked the testing approach until the project was introduced

# Sprint 17

April 13, 2020 from 9:30am to 5:30pm

## Sprint Backlog

### Generate a CHANGELOG.md from an existing CHANGELOG.md
- Add flag `-o markdown` to `kraken changelog view` to output changelog as markdown

### Validate an existing CHANGELOG.md and display errors
- Add command `kraken changelog check` which reads the CHANGELOG.md and reports anything unexpected
- Possible error scenarios:
  - No header
  - Missing link references
  - Unknown change group type
  - Invalid URLs

### Perform a GitHub release
- Finish the tracer bullet functionality for `kraken release`
  - Add tests
  - Add Kraken Service to contain the logic that's living in the command

### Track the status of an active release in Kubernetes
- Parse the flux logs? for information
- Kubernetes get of deployment status 
- Maybe it's just simplifying the `kraken kubernetes pods` command
- Maybe add some type of `kraken status` 
  - Releasing Output:
```
Project: Kraken
Status: Releasing
Pods:
- <pod-name> : Init
- <pod-name> : Init
```
  - Released Output:
```
Project: Kraken
Status: Released
Pods:
- <pod-name> : Runnning
- <pod-name> : Runnning
```
  - Error Output:
```
Project: Kraken
Status: Broken
Pods:
- <pod-name> : CrashLookBackOff
- <pod-name> : CrashLookBackOff
```