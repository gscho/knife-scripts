# knife-scripts

This repository contains collection of ruby scripts to be executed using `knife exec`.

## Usage

All of the scripts in this repo are meant to be executed by a chef workstation user with proper access to a chef server.

```
knife exec scripts/<script_name>
```

## Update Attributes Across All Environments of an Organization

```
knife exec scripts/update_env_attributes <path_to_json_file>
```

This script will update _every_ environment except `_default` with whatever attributes you define in your json file. See [test.json](./test.json) for an example.

## License

MIT
