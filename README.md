# Recycle

A quick little gem for managing shortcuts for navigation and quick little helper
functions.  Often dot files can be frustrating to manage, this aims to remove
some of the frustration by adding an easy way of adding directory shortcuts
(through aliases) and helper functions for commands.

# Usage

* install the gem
* run the command `recycle init`
* add the following to your shell
```sh
eval "$(recycle exec)"
```

Listing configuration:

```sh
recycle list
```

![List](https://raw.github.com/jeremywrowe/recycle/master/recycle-list.png)

Adding a command shortcut:

```sh
recycle add -c lld "ls -ld .?*"
```

Adding a directory shortcut:

```sh
recycle add -d h "\$HOME"
```

*note* You may have to escape reserved shell terms like shown above, since you
may not want it to resolve until a later time.

# Code status
[![Build Status](https://travis-ci.org/jeremywrowe/recycle.svg?branch=master)](https://travis-ci.org/jeremywrowe/recycle)

# Contributing

This is still very much a work in progress, but give it a shot and open up pull
requests as you see fit.
