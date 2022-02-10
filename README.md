# Handling Multiple ssh-keys on One Machine

> This section is for Windows

### Extending the **`bash.bashrc`** File of Git Terminal


<h3>SOLUTION</h3>

The solution I found was to start the agent and add the keys I wanted. The terminal, on start up, should look through the keys and add them. From my knowledge and experience, the Git for windows terminal can only manage one active key. Even if you add multiple keys to the agent, the first one will be the default key that git looks to when preforming authentication based on commands. All of my keys have passphrases, therefore they are not automatically added. When the terminal starts it prompts for the passphrase and I only "activate" the key I want. The `bashrc` file in this repository is extended code to my original `bash.bashrc` file that I include with added commentary.

---

<h3>ATTEMPTED FIXES & WHY</h3>

When dealing with multiple users and wanting to use ssh-keys for running `git clone`, `push`, `pull`, etc. on repositories, I came across an issue with having multiple ssh-keys. The main complication is the `git` terminal doesn't know which key goes to which account. I would like to think the terminal would have some assignable feature to say which account should use which key, or that the user can specify, but I couldn't find anything. I did find multiple articles mentioning config files, or `GIT_SSH_COMMAND`, which did work for me but not completely as expected. The `GIT_SSH_COMMAND` worked but seems bulky and unnecessary if I use both accounts often. The configuration file for `~/.ssh/` did not work right away, I found articles that mentioned you needed to add the private ssh keys to the agent. Most articles mentioning this "quick fix" said to add it into the `.bashrc` of the terminal so it'd run every time a new session started. This seems redundant now, the configuration file is likely not needed, I only needed to make sure my private keys were known to the agent.
