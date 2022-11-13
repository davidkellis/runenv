# runenv

This command line tool loads environment variables from a file and then executes the specified command in an environment containing the pre-existing environment variables as well as the environment variables defined within the specified environment file.

## Installation

```
crystal build src/runenv.cr
```

## Usage

```
$ runenv .env.local foo              # load .env.local into environment and then run foo command

$ runenv foo                         # load .env into environment and then run the foo command

$ runenv foo bar baz                 # load .env into environment and then run `foo bar baz`

$ runenv .env.dev foo bar baz        # load .env.dev into environment and then run `foo bar baz`
```

## Contributors

- [David Ellis](https://github.com/davidkellis) - creator and maintainer
