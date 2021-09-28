# AZURE_CLOUD_PROJECT

Project for assignment for cloud architecture and description

The files in this repository were used to configure the network depicted below.

(DIAGRAMS/PROJECT13_UPDATED.drawio)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the /etc/ansible/elk_docker.yml file may be used to install only certain pieces of it, such as Filebeat.



This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly AVAILABLE, in addition to restricting ACCESS to the network.
What aspect of security do load balancers protect? What is the advantage of a jump box?


Load balancers protects the system from DDoS attacks by distributing traffic.
The advantage of a jump box is to give access to the user from a single machine that can be secured and monitored.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the LOG FILES and SYSTEM RESOURCES.
-  What does Filebeat watch for?---------> Filebeat watches for any information in the file system which has been changed and when it has.
-  What does Metricbeat record?----------> Metricbeat takes the metrics and statistics that collects and ships them to the output you specify.


The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  |13.68.145.228| Linux           |
| VM -WEB1 |  SERVER  | 10.0.0.5   |  Linux           |
| VM -WEB2 | SERVER   | 10.0.0.7   |  Linux           |
| ELK      | SERVER   | 10.0.0.4   |  Linux           |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JUMPBOX machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
 HOST MACHINE IP (LAPTOP): 142.126.115.121

Machines within the network can only be accessed by SSH.

Which machine did you allow to access your ELK VM? What was its IP address?
--JUMP Box VM: VNET IP 10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | HOME IP:142.126.115.121  |
|  WEB1    | NO                  | 13.68.145.228            |
|  WEB2    | NO                  | 13.68.145.228            |
|   ELK    | NO                  | 13.68.145.228            |

## Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
What is the main advantage of automating configuration with Ansible?
--Advantage is that you can put commands OR INSTALL into multiple servers from a single playbook

The playbook implements the following tasks:

--Install: docker.io
--Install: python-pip
--Install: docker

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(DIAGRAMS/docker_elk_container.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
WEB1 -VM :  10.0.0.5
WEB2 -VM :  10.0.0.7
DVWA-VM3 :  10.0.0.8

We have installed the following Beats on these machines:
-- installed Filebeat and metricbeat

These Beats allow us to collect the following information from each machine:
: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

--Filebeat collects the changes done.  

screenshot path: (DIAGRAMS/filebeat.png)

--Metric beat collects metrics and statistics

screenshot path:(DIAGRAMS/metricbeat.png)

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-configuration.yml file to /etc/ansible/
- Update the /etc/ansible/host file to add webserver/elkserver ip addresses to include...
- Run the playbook, and navigate to http://168.61.20.147:5601(KIBANA)to check that the installation worked as expected.

 Answer the following questions to fill in the blanks:_
Which file is the playbook? Where do you copy it?
----- Copy the filebeat-configuration.yml file to /etc/ansible/

Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
---HOST FILE Update the /etc/ansible/host file to add webserver/elkserver ip addresses.

Which URL do you navigate to in order to check that the ELK server is running?
---Run the playbook, and navigate to http://168.61.20.147:5601(KIBANA)


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
