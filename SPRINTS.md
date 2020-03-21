# Sprint 1 

March 21, 2020 from 11:00am to 12:00pm

## Stories

### List kubernetes deployment - 5

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
