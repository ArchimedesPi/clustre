## Running the project
This project requires Vagrant and Ansible.
In addition, you'll have to install the `vagrant-reload` plugin:
```
$ vagrant plugin install vagrant-reload
```

After installing the dependencies, just do
```
vagrant up
```
to start up the cluster.

After it's booted, you can ssh to any machine in the cluster with `vagrant ssh <hostname>`.
You'll probably want to ssh to `client0`. The Lustre filesystem is mounted at `/mnt/lustre`.