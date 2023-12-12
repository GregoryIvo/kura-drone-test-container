# Kura Drone Test Container
spin up many instances of Kura, with a customized snapshot via environment variables.

# How to run
 1) Modify the docker-compose.yml to include expected settings in kura
 2) build the kura-drone container
 3) run the docker-compose script (or run the run.sh)

## kura-drone container
 - uses the latest build of the Kura container on Docker Hub
 - adds a custom templated snapshot_0 and a setup script to the container
 - container entry point is changed to the setup script

### Exposed Properties Matrix
property name | default value | Variable Name in snapshot | Environment Variable 
|-----------|-----------|-----------|-----------|
broker url | mqtt://broker-url:1883/ | {% BROKER_URL %} | BROKER_URL
auto connect on startup | false | {% AUTO_CONNECT_ON_STARTUP %} | AUTO_CONNECT_ON_STARTUP
device custom name | Docker Device | {% DEVICE_CUSTOM_NAME %} | DEVICE_CUSTOM_NAME
device display name | Docker Device | {% DEVICE_DISPLAY_NAME %} | DEVICE_DISPLAY_NAME
account name | account-name | {% ACCOUNT_NAME %} | ACCOUNT_NAME
user name | username | {% USERNAME %} | USERNAME
password | password | {% PASSWORD %} | PASSWORD
