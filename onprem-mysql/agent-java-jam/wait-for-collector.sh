#!/bin/sh

set -e

key="$1"

>&2 echo "key is $key"

until $(curl --output /dev/null --silent --head --fail http://analysis-server:8080); do
  >&2 echo "Analysis Server is unavailable - sleeping"
  sleep 1
done

>&2 echo "Analysis Server is up - starting Java Agent install"

wget -O - -o /dev/null "http://analysis-server:8080/app/download?t=inst" | bash /dev/stdin -i --sk=$key --s3_url http://analysis-server:8080/service/png --installer_url "http://analysis-server:8080/app/download?t=tgz" --base_url http://analysis-server:8080 --machine_name=java-agent --daemon_host=collector --daemon_port=6060

java -agentlib:TakipiAgent -Dtakipi.name=JavaJam -Dtakipi.deployment.name=v1.0 -Dtakipi.debug.logconsole -jar javajam.jar