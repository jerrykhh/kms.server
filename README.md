# KMS.server

## Active Service

KMS_activation_key you can reference here: 
[KMS client activation and product keys](https://docs.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys)

### Active Windows
Open command prompt (cmd) with Administrator mode
```
slmgr -upk 
slmgr -ipk {KMS_activation_key}
slmgr -skms {server_ip}
slmgr -ato
slmgr -dlv
```

### Active Office
```
cscript ospp.vbs /dstatus
cscript ospp.vbs /inpkey:{KMS_acrivation_key}
cscript ospp.vbs /sethst:{server_ip}
cscript ospp.vbs /act
```


## Server Setup
Please install docker in your server

Example:
### Ubuntu 
```
$ sudo apt-get install docker.io
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
$ exit
# access the host again
```

Clone the Project
```
git clone https://github.com/jerrykhh/kms.server.git
cd kms.server
```

Docker Build and Start
```
docker build . -t kms-server
docker run -d -p 1688:1688 kms-server
docker ps
```

Please add following Ingree Rules in your security group:
| port | IP Protocol | Source CIDR |
| ---- | ----------- | ----------- |
| 1688 | TCP | 0.0.0.0/0 |