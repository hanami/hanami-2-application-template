# Hanami 2 Application Tempalte

To clone this template:

```sh
gem install raygun
raygun -p timriley/hanami-2-application-template <your_project_name_here>
```

After cloning, you can delete this section from the README.

# AppPrototype

This is an Hanami 2 application.

## Local development

## Requirements

The scripts below require [Homebrew][brew] and [asdf][asdf] installed, and
[asdf added to your shell][asdf-shell].

If you prefer different tools, remove `Brewfile` and `.tool-versions`, and adapt
the `script/` files (mentioned below) to use your preferred tools.

[brew]: https://brew.sh
[asdf]: https://asdf-vm.com
[asdf-shell]: https://asdf-vm.com/#/core-manage-asdf-vm?id=add-to-your-shell

### Installation

After cloning, run:

```
./script/bootstrap
```

### Running supporting services

To start the supporting services, run:

```
./script/support
```

These must be running before completing the following steps.

### Setup

After the supporting services have started, run:

```
./script/setup
```

### After pulling changes

After pulling changes from the remote, run:

```
./script/update
```

### Running the app

To run the app:

```
./script/server
```

This launches the application processes using [overmind][overmind], which places
each into a [tmux][tmux] session. You can connect to a specific process to
interact with it (which is useful when using an interactive debugger inside the
`web` process):

```
overmind c web
```

⚠️ To detatch from the tmux session, use the
<kbd>ctrl</kbd>+<kbd>b</kbd>,<kbd>d</kbd> shortcut.

[overmind]: https://github.com/DarthSim/overmind
[tmux]: https://thoughtbot.com/blog/a-tmux-crash-course
