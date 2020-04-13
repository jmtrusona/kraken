# Kraken

```
                        ___
                     .-'   `'.
                    /         \
                    |         ;
                    |         |           ___.--,
           _.._     |0) ~ (0) |    _.---'`__.-( (_.
    __.--'`_.. '.__.\    '--. \_.-' ,.--'`     `""`
   ( ,.--'`   ',__ /./;   ;, '.__.'`    __
   _`) )  .---.__.' / |   |\   \__..--""  """--.,_
  `---' .'.''-._.-'`_./  /\ '.  \ _.-~~~````~~~-._`-.__.'
        | |  .' _.-' |  |  \  \  '.               `~---`
         \ \/ .'     \  \   '. '-._)
          \/ /        \  \    `=.__`~-.
     jgs  / /\         `) )    / / `"".`\
    , _.-'.'\ \        / /    ( (     / /
     `--~`   ) )    .-'.'      '.'.  | (
            (/`    ( (`          ) )  '-;
             `      '-;         (-'
```

## Installation

```shell script
gem install kraken -v <version> --source  https://$ARTIFACTORY_USERNAME:$ARTIFACTORY_PASSWORD@trusona.jfrog.io/trusona/api/gems/trusona-rubygems
```

## Release

1. Update the CHANGELOG.md with new release version and changes
1. Update the `lib/kraken/version.rb` to for latest version according to semver
1. Create a git tag for the version in the form `vX.Y.Z` to trigger a publish in CI