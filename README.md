# irb-git

## Background
I wanted to be able to run Git commands from an irb console session instead of requiring a separate terminal per project. `system 'git push origin master'` works fine, but having to wrap every single command in `system('')` bugs me.

## Usage
1. Drop `git.rb` in the same folder as your project (for convenience)
2. Run `irb` 
3. Run `load 'git.rb'` 


## Syntax
- Call any git method using `.` in place of `<space>`, eg. `git.push.origin.master`. 
- Flags may be passed as strings or symbols to the preceding command, eg. `git.checkout('-b').new_branch` or `git.checkout(:b).new_branch`.   
- Names using dashes need to be passed as string arguments to the preceding command. They will be joined in the order provided, eg. `git.checkout :b, 'new-branch'`
- Commit messages require special attention due to quotation marks, eg. `git.commit :am, '"this is a commit message"'`

