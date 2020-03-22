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

### List Trello cards

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
