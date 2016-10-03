# Developer's System

It automatically deploys a Ubuntu 16.04 LTS (Xenial Xerus) with all necessary settings and software to develop Python and PHP7 projects. It will provision the system using vagrant with settings for virtualbox, deploys with ArtWeb.
 
A Linux system with Xenial Xerus and it automatically provisions the system with Apache2, PHP7, MySQL and MySQL related PHP packages, Adminer for database admin, also includes Python and related tools.


#### Install prerequisites:
---------------------------

1. Install VirtualBox. It can with VMWare, Hyper-V etc. by changing settings.
2. Install Git with commandline tools.
3. Install Vagrant.

#### Install Instructions:
--------------------------

- Open command prompt and enter:``` $ git clone https://github.com/aazhbd/AutoDeploy.git ```

- Change directory into the newly created dev_sys folder and enter: ``` $ vagrant up ```

- Once the system is up and finished provisioning itself, open web browser and set address to: ``` http://localhost:8080/Artweb/webroot/ ```

It should show the deails of the PHP5 installation and it contains a link on the top to the default page for ArtWeb framework for PHP5. The project can be worked with in the ```dev_sys/data/ArtWeb``` folder.

Also, the link to "ArtWeb - Home" can be opened to open the ArtWeb home page.
And the link to "Adminer - Home" can be opened to access a mysql admin interface.

- Once the system is up, to work with the system itself: ``` $ vagrant ssh ```

- To stop the system, enter: ``` $ vagrant halt ```
Or enter shutdown command with sudo from inside the system.

- To reprovision the system, enter:
```
$ vagrant provision
or
$ vagrant up --provision
```
Reprovisioning the system will upgrade the system packages and try to change in any existing ArtWeb directory.


### License
-----------

The code is released under MIT License.


### Contact
-----------

Abdullah Al Zakir Hossain (aazhbd@yahoo.com)
