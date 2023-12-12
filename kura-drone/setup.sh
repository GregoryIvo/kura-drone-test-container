#!/bin/bash

echo "Setting up Kura configuration with env vars"

if [ -f edited ]; then
  echo "running kura, skipping setup"
  sh /usr/local/bin/kura-entry-point
fi

touch edited


if [[ -z "${BROKER_URL}" ]]; then
  echo "DEPLOY_ENV is not set. Setting to default value"
  sed -i 's!{% BROKER_URL %}!mqtt://localhost:8443!g' "snapshot_0.xml"
else
  sed -i "s!{% BROKER_URL %}!$BROKER_URL!g" "snapshot_0.xml"
fi


if [[ -z "${AUTO_CONNECT_ON_STARTUP}" ]]; then
  echo "AUTO_CONNECT_ON_STARTUP is not set. Setting to default value"
  sed -i 's!{% AUTO_CONNECT_ON_STARTUP %}!false!g' "snapshot_0.xml"
else
  sed -i "s!{% AUTO_CONNECT_ON_STARTUP %}!$AUTO_CONNECT_ON_STARTUP!g" "snapshot_0.xml"
fi


if [[ -z "${DEVICE_CUSTOM_NAME}" ]]; then
  echo "DEVICE_CUSTOM_NAME is not set. Setting to default value"
  sed -i 's!{% DEVICE_CUSTOM_NAME %}!custom_device_name!g' "snapshot_0.xml"
else
  sed -i "s!{% DEVICE_CUSTOM_NAME %}!$DEVICE_CUSTOM_NAME!g" "snapshot_0.xml"
fi


if [[ -z "${DEVICE_DISPLAY_NAME}" ]]; then
  echo "DEVICE_DISPLAY_NAME is not set. Setting to default value"
  sed -i 's!{% DEVICE_DISPLAY_NAME %}!custom_device_name!g' "snapshot_0.xml"
else
  sed -i "s!{% DEVICE_DISPLAY_NAME %}!$DEVICE_DISPLAY_NAME!g" "snapshot_0.xml"
fi

if [[ -z "${ACCOUNT_NAME}" ]]; then
  echo "ACCOUNT_NAME is not set. Setting to default value"
  sed -i 's!{% ACCOUNT_NAME %}!account-name!g' "snapshot_0.xml"
else
  sed -i "s!{% ACCOUNT_NAME %}!$ACCOUNT_NAME!g" "snapshot_0.xml"
fi

if [[ -z "${USERNAME}" ]]; then
  echo "USERNAME is not set. Setting to default value"
  sed -i 's!{% USERNAME %}!usern-name!g' "snapshot_0.xml"
else
  sed -i "s!{% USERNAME %}!$USERNAME!g" "snapshot_0.xml"
fi

if [[ -z "${PASSWORD}" ]]; then
  echo "PASSWORD is not set. Setting to default value"
  sed -i 's!{% PASSWORD %}!usern-name!g' "snapshot_0.xml"
else
  sed -i "s!{% PASSWORD %}!$PASSWORD!g" "snapshot_0.xml"
fi


mv snapshot_0.xml /opt/eclipse/kura/user/snapshots/snapshot_0.xml

echo "Kura configuration set up successfully"
sh /usr/local/bin/kura-entry-point


