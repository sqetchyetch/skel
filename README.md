# Installation instructions at end of text..
# 
# the <freshinstall> command checks for must have tools and binaries every admin needs to efficiently perform the duties of a professional
# technician. saving time by allowing this precollected system of dependencies and tools tailored for each environment makes it easy to 
# setup a new environment with everything necessary to complete any task. a user guided summary detects and adds components based on arch
# type and shell environment so the user can set it and forget it so to speak, improving multi tasking capability and allowing freedom 
# from boardlock or desklock. stick to scripts so you don't get stuck..

# the <gitconfigs> command is a syncing effort to make configuration files used by local admins easily accessible from a remote github
# repository. this command executes a script that guides the user through downloading and installing installation configuration files 
# for a variety of computer architecture types and shell environments. in an effort to reduce time and allow for portability without 
# increasing down-time, much care has been taken to adapt these scripts in a way that makes reading the scripts easy and changing them
# if necessary, pretty straighforward. a newly unconfigured terminal/shell environment can be a burden when faced with a new machine 
# that needs a quick fix. by preselecting the most common and necessary configurations and components we have allowed any admin to take
# control of any new environment in the most comfortable and convenient manner.

# the <homeconfigs> command is for syncing with the skeleton folder which contains initial home configuration files for users 
# when creating or adding a new user account. the purpose is to update each directory with current working configurations that 
# make it easy to navigate the system by adding known aliases, colors and notification settings that have been created in advance
# by a local administrator; thereby, saving time by allowing the local admin to fix issues without constantly having to install 
# and sync these known home configurations beforehand. Fluidity of styling and rearrangement of commands by adding aliases can be a 
# distraction to someone who is unfamiliar with a terminal/shell environment; or, these modifications can increase user productivity
# and output. 

# emphasis has been placed and legibility and ease of modification/customization of files but for the most part, each has been determined
# to work "out of the box" so to speak. care has been taken to include options for various user case scenarios; however, we have a user 
# definied preference here and any lack of knowledge may show as a lack of configuration settings for your device configuration. hopefully
# if you find these scripts useful, they won't be too difficult to adapt.

# To install: Fork the repository and modify the src folder to customize you files the way you like them. Defaults are perfectly acceptable
# however, having your own fork will allow you the freedom of choice and any updates that add functionality to this repo will leave the src
# folder untouched to avoid modifying your config changes. 
# Once forked: 
# $ git clone <your_forked_url>
# $ cd skel
# $ ./install.sh
# follow the prompts..
#  Currently supported: zsh, bash
