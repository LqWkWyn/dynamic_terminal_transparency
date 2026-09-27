# windows terminal transparency controller

a small powershell tool for dynamically modifying windows terminal transparency and blur options straight from your command line session. it bypasses local configuration layers to enforce changes globally across your running profiles.

powershell

## features

- **global automation:** injects settings rules targeting all default configurations at once.
- **override management:** clears individual profile properties automatically so active instances don't block your global values.
- **acrylic styling:** switches seamlessly between classic alpha transparency or dynamic desktop frosted layouts.
- **quick calculation:** translates whole integer opacity percentages into appropriate decimal factors for microsoft system engine compatibility.
- **two ways to control it:** pass simple positioning arguments or explicit parameter flags to toggle state adjustments.

## quick disclaimer

this project is for workflow optimization and environment customization. ensure that your underlying windows installation allows standard hardware styling parameters and accessibility options. 

keep custom script paths, deployment hooks, and administrative elevated environment definitions distinct from shared open public domains. future-you will be grateful.

## quickstart

### prerequisites

you will need an installation of windows terminal and administrative right authorization to modify user runtime paths.

verify your profile installation point with powershell:

\$PROFILE

### load the function

open your powershell system environment configuration profile file:

notepad \$PROFILE

copy the core implementation script function directly inside, save the text file, and re-index your active running terminal shell:

. \$PROFILE

## using the controller

the opacity modifier is designed to allow simple numerical values to control overall styling density.

### change global opacity

set-opacity 65

### clear glass mode

pass an evaluation flag to completely drop backing blur effects for a clean see-through look:

set-opacity 45 off

### explicit arguments

you can target explicit argument indicators directly whenever configuring from inside alternate runtime automation pipelines:

set-opacity 80 -a on

## debugging blocks

if execution layers report success but visual state remains unchanged:

1. press `ctrl` + `,` to access terminal graphic dashboards.
2. confirm under **appearance** that window materials are assigned to **none** or **acrylic** rather than mica configurations.
3. ensure global operating system settings have **transparency effects** enabled inside accessibility menus.
