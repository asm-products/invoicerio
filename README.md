# Invoicerio

## A web app for invoices.

This is a product being built by the Assembly community. You can help push this idea forward by visiting [https://assembly.com/invoicerio](https://assembly.com/invoicerio).

### How Assembly Works

Assembly products are like open-source and made with contributions from the community. Assembly handles the boring stuff like hosting, support, financing, legal, etc. Once the product launches we collect the revenue and split the profits amongst the contributors.

Visit [https://assembly.com](https://assembly.com) to learn more.

# Invoicerio virtual development environment
`invoicerio` comes with a vagrantfile that creates and configures a portable, reproducible and lightweight virtual development environment for [invoicerio](https://github.com/asm-products/invoicerio).

At the moment we use [rwbox](https://github.com/le0pard/rwbox) as basebox (Ubuntu 14.04).

>RWBox contains:
> - RVM with compiled Ruby 1.9.3-p547, 2.0.0-p481, 2.1.2, jruby-1.7.12
> - MySQL, PostgreSQL, Redis and Memcached
> - Dev libs for pg, mysql2, rmagick, curb and another gems

## Installation
First, make sure you have the latest version of [Vagrant](http://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads) installed.

Then, do: 
```bash
$ git clone https://github.com/asm-products/invoicerio
$ cd invoicerio
```

Now before you move on, decide if you would like to set up the environment with a clone of [asm-products/invoicerio](https://github.com/asm-products/invoicerio) or your own fork. On default, `asm-products/invoicerio` is cloned, but you can change the `vagrant/bootstrap.sh` file and replace it with your forked repository.

Execute the following command to create the virtual development environment:

```bash
$ vagrant up
```

This will download a virtual machine image and start a bootstrap process that installs rails, postgresql and clone invoicerio. Running `vagrant up` for the first time will take a while so go grab a coffee.

## Usage
To launch invoicerio, execute the folowing (from the `invoicerio` folder):

```bash
# The following command sshs into the vagrant virtual machine.
$ vagrant ssh

# Go to the /vagrant folder.
$ cd /vagrant

# Create the database etc, only execute this once.
$ bin/rake db:create db:migrate

# Start the server, you're good to go.
$ bin/rails server
```

Now point your browser on your host machine to [http://localhost:3100](http://localhost:3100) for the web-interface. Please keep in mind that the Vagrant box contains a rule that maps port 3000 from the guest machine to port 3100 on the host machine.

## Development
Note that Vagrant syncs the `invoicerio` folder (on the host machine) with `/vagrant` (on the guest machine). You're able to access invoicerio from the host machine and you can use your IDE from the host machine for development.

## Tips
Please read the [rwbox](https://github.com/le0pard/rwbox) README for more information or if you have trouble starting the virtual machine.

### DB Credentials
* MySQL:
  * root/vagrant
  * vagrant/vagrant
* PostgreSQL:
  * postgres/vagrant
  * vagrant/vagrant

### Reset the box
In order to reset the box, execute the following from the `invoicerio` folder on the host:

```bash
# Reset the box, this will take a while.
$ vagrant destroy --force && vagrant up
```

Note that this will only reset the environment (like port-forwarding, the database, installed packages/gems, everything that's stored outside `/vagrant` etc). The `invoicerio` code will _not_ change.

### Port forwarding
Ports form this list are forwarded by default:

```
3000 => 3100
1080 => 1180
```

**NOTICE**: if you'll start mailcatcher gem and want to see mailcatcher inbox from outside – don't forget to use --ip option.

## Troubleshooting
If the `vagrant up` hangs at:

```bash
$        default: Warning: Remote connection disconnect. Retrying...
```

Just press `CTRL+c` and execute `vagrant up` again. I'm not sure what causes the hickup.
