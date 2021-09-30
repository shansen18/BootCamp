## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

  
![elk](Images/Elk_network_Map.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

FileBeat

[Filebeat playbook](https://github.com/shansen18/BootCamp/blob/main/Week13/Scripts/ansible/files/filebeat-playbook.yml)

[Filebeat Config](https://github.com/shansen18/BootCamp/blob/main/Week13/Scripts/ansible/files/filebeat-config.yml)

MetricBeat
[Metricbeat Playbook](https://github.com/shansen18/BootCamp/blob/main/Week13/Scripts/ansible/files/metricbeat-playbook.yml)

[Metricbeat Config](Week13\Scripts\ansible\files\metricbeat-config.yml)


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unautherized access to the network. I used the load balancer to create a redundancey the protects the DVWA by creating an instance of DVWA on 2 servers, Web1, and Web2, in the same load balancer pool. If one goes down the other instance will take over, thus protecting from a DDOS attack, or any other faults that my bring one server down. 
To access the Web1 and Web2 servers I created a "Jump-Box" which I can only connect to via my home computer using the SSH protocol. I secured the connection between my computer and the jump box, by only allowing inbound traffic from my homes public IP to ports 22 and 80. I further secured port 22 on the jumpbox by creating a new SSH-rsa key and only allowing connection from that SSH key to the jumpbox. Inside the jumpbox I created a docker with it's own SSH-rsa key and shared the key with Web1 and Web2, only allowing SSH access to them from my jump box docker.  

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs, files system, system resources, and system services. For the ELK server we installed two beats, Filebeat, and Metricbeat. 

Filebeat gathers information about the file system, and logs which files have changed and when. It then sends this information to be processed in Logstash or into Elasticsearch for indexing. From there Kibana is used to visualize the data. 

Metricbeat gathers information about the system it is installed on. This includes the system resources and services. Just like file be it send the information to Logstash or Elasticsearch, and from there to Kibana where it can be vizualized. 


The configuration details of each machine may be found below
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web1     | DVWA     | 10.0.0.5   | Linux            |
| Web2     | DVWA     | 10.0.0.6   | Linux            |
| Elk      | Elk      | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the _____ machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _TODO: Add whitelisted IP addresses_

Machines within the network can only be accessed by _____.
- _TODO: Which machine did you allow to access your ELK VM? What was its IP address?_

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes/No              | 10.0.0.1 10.0.0.2    |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _TODO: What is the main advantage of automating configuration with Ansible?_

The playbook implements the following tasks:
- _TODO: In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._
- ...
- ...

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

**Note**: The following image link needs to be updated. Replace `docker_ps_output.png` with the name of your screenshot image file.  


![TODO: Update the path with the name of your screenshot of docker ps output](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
