# ow1_emulator

This repository contains OverPy source code for building Overwatch 2 Workshop gamemode [Overwatch 1 Emulator](https://workshop.codes/KHTG0).  

## Building

For instructions on how to use OverPy, see [here](https://github.com/Zezombye/overpy/wiki)
  
1. Compile main.opy using the compiling instructions at [OverPy Wiki](https://github.com/Zezombye/overpy/wiki/General-usage#Compiling)
2. Open a custom game in Overwatch
3. Paste the compiled gamemode code

## Contributing

1. Find an [issue](https://github.com/MaxwellJung/ow1_emulator/issues) to fix (or submit one yourself)
2. Clone this repo, make a new branch from main or staging, then fix the issue on the new branch
3. Submit pull request to merge your branch to staging branch (make sure to [reference the issue](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue))
4. Wait for your feature in staging branch to be merged to main

## Code Style

This codebase follows Python's [PEP 8 style guide](https://peps.python.org/pep-0008/) (because OverPy follows Python syntax).

1. Variables should be snake_case. Example: hero_health_armor
2. Function names should be camelCase. Example: applyCustomHealth()
3. File names should be snake_case. Example: custom_heroes.opy

## Changelog

See [releases](https://github.com/MaxwellJung/ow1_emulator/releases)
