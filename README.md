# irb-git

## Background
I wanted to run some Git commands from an irb console session. The simple approach is: `system 'git push origin master'`. 
This worked fine, with the exception of mandatory fiddly quotation marks, especially with nested commit messages. Hence, I decided to improve the `git` experience within irb.   

## Usage
1. Drop `git.rb` in the same folder as your project (for convenience)
2. Run `irb` 
3. Run `load 'git.rb'` 


## Syntax
Call any git method using `.` in place of `<space>`, eg. `git.push.origin.master`. 
Flags may be passed as strings or symbols to the preceding command, eg. `git.checkout('-b').new_branch` or `git.checkout(:b).new_branch`.   
Tricky cases such as commands with dashes may be passed as string arguments which get joined in the order provided, eg. `git.checkout :b, 'new-branch'
Commit messages require special attention due to quotation marks, eg. `git.commit :am, '"this is a commit message"'

