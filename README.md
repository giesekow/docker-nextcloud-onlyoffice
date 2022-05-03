# nextcloud setup with onlyoffice integration
This repo contains docker setup of nextcloud with onlyoffice for editing office documents

## Installation
Note: This repo has only been tested on `ubuntu 20.04` and we recommend the same, nonetheless it should work easily on unix systems and might need few changes (mounted paths in docker-compose.yml) to work on windows.

### Install requirements
1. docker
2. docker-compose
3. any editor for editting the files (vim, gedit etc.)

On ubuntu 20.04 install the requirements with:  
`sudo apt-get update && sudo apt-get install -y docker docker-compose vim`  

Add current user to `docker` group (ubuntu):  
`sudo usermod -aG docker $USER`

You need to logout and login for the changes to take effect before you continue.


### Before running the app
#### Update `.env` file and verify the settings in there.
Meaning of the settings are below:
1. `LE_EMAIL`: the email address used by letsencrypt to generate ssl certificates.
2. `LE_REDIRECT`(yes/no): whether to redirect http to https after installation of the certificate.
3. `PROXY_SSL`: whether you want to use `ssl` certificate.
4. `MYSQL_ROOT_PASSWORD`: root password for the mysql database.
5. `MYSQL_USER`: normal user account for the application.
6. `MYSQL_PASSWORD`: password for the normal user account for the application.
7. `MYSQL_DATABASE`: database name for the application.
8. `ONLYOFFICE_JWT_SECRET`: the secret that will be used to connect nextcloud and onlyoffice.
9. `ONLYOFFICE_DOMIAN`: the domain name or url that will be used to reach the onlyoffice server.
10. `APP_DOMAIN`: the main domain name that will be used to reach the nextcloud application.

Make sure the `ONLYOFFICE_DOMIAN` and `APP_DOMAIN` domain names are correctly pointing to the server running the app for the letsencript and the application to work.

#### Update `sites-available/app`
Open the `sites-available/app` and change the server_name fields to match the `ONLYOFFICE_DOMIAN` and `APP_DOMAIN` values.
1. change `<APP-URL>` (on line 7) to the value you entered above for `APP_DOMAIN`;
2. change `<ONLYOFFICE-URL>` (on line 41) to the value you entered above for `ONLYOFFICE_DOMIAN`;
Note care must be take *NOT* to remove the `;` at the end of lines 7 and 41. This will make the file unusable.


### Running the app
Starting and stoping the application using `docker-compose`  
Start : `docker-compose up -d`  
Stop : `docker-compose down`

### Running the app (ubuntu and other debain systems)
Alternative on ubuntu and other linux servers you can use the `start.sh` and `stop.sh` scripts to start and stop the application respectively.  
To start the application: `bash start.sh`  
To stop the application: `bash stop.sh`  

You can also install the application so that it starts automatically when you boot your system.  
`bash install.sh`

### Permission issues
In case you have errors which have to do with permission it might be that your user account does not belong to the `docker` group.


## Connecting nextcloud and onlyoffice
To connect nextcloud and onlyoffice you need to install the onlyoffice connector app in nextcloud and configure the app.  
You can follow the documentation [here](https://helpcenter.onlyoffice.com/gettingstarted/integration/Nextcloud.aspx).

Note:
`secret` field refers to the value set for `ONLYOFFICE_JWT_SECRET` in the `.env` file.