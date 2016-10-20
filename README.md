## Running the project
This project requires Vagrant and Ansible. You can get those from your system package manager on Linux, or Homebrew on macOS. If you're on Windows, all bets are off.
In addition, you'll have to install the `vagrant-reload` plugin:
```
$ vagrant plugin install vagrant-reload
```

After installing the dependencies, just do
```
vagrant up
```
to start up the cluster.

After it's booted, you can ssh to any machine with `vagrant ssh <hostname>`.
You'll probably want to ssh to `client0` to play with the mounted filesystem - the mountpoint is `/mnt/lustre`.