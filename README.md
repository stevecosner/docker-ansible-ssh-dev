# docker-ansible-ssh-dev

Create a docker container with SSH and private key ready to go for ansible login.

Copy id_rsa_dev to your ~/.ssh directory

May have to update its permissions.

Build the docker container:

docker build -t d1 .

Run the container:

docker run -itd -p 8080:80 -p 2222:22 d1

Port 22 and 80 will be opened on the container and 2222 and 8080 will be opened on the host allowing reachability on the private network.

Ping the new container:

ping 172.17.0.2

If using a different docker bridge you may have a different ip address.

Test ssh to the container:

ssh -i ~/.ssh/id_rsa_dev root@172.17.0.2

Use an ansible adhoc command to test:

ansible docker -m ping -u root

If all good, perform update using ansible ad hoc:

ansible docker -m apt -a update_cache=yes -u root

Try and install nginx to test the webserver:

ansible docker -m apt -a "name=nginx state=present" -u root

Start the service:

ansible docker -m service -a "name=nginx state=started" -u root


