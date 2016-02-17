# irb-git

## Background
I wanted to run some Git commands from an irb console session. The simple approach is: `system 'git push origin master'`. 
This worked fine, with the exception of mandatory fiddly quotation marks, especially with nested commit messages. Hence, I decided to improve the `git` experience within irb.   

## Usage
1. Drop `git.rb` in the same folder as your project (for convenience)
2. Run `irb` 
3. Run `load 'git.rb'` 
4. Call any git method using `.` in place of `<space>`, eg. `git.push.origin.master`. Flags need to be wrapped in quotes and passed to their respective methods, eg. `git.checkout('-b').new_branch` 
