# Wikipedia's 'Did You Know' extract printer

This is a combination of `curl`, `jq` and `sed` to download and print the 'Did You Know' [section](https://en.wikipedia.org/wiki/Template:Did_you_know#Hooks) from Wikipedia.

In my local machine, I run this script daily with a cronjob and store it in a file.
Then I added a command to my `.zshrc` to print that file to the console every time I open a new session.
