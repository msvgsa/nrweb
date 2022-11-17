#!/bin/bash

echo 'newrelic.daemon.collector_host="gov-collector.newrelic.com"' >> /home/vcap/app/php/etc/php.ini
echo 'newrelic.dont_launch=0' >> /home/vcap/app/php/etc/php.ini
echo 'newrelic.enabled=true' >> /home/vcap/app/php/etc/php.ini

echo 'newrelic.daemon.loglevel="debug"' >> /home/vcap/app/php/etc/php.ini
echo 'newrelic.loglevel="verbosedebug"' >> /home/vcap/app/php/etc/php.ini

echo 'newrelic.daemon.ssl_ca_path="/etc/ssl/certs/"' >> /home/vcap/app/php/etc/php.ini
echo 'newrelic.daemon.ssl_ca_bundle="/etc/ssl/certs/ca-certificates.crt"' >> /home/vcap/app/php/etc/php.ini

#### use @newrelic-daemon insteak of socket file
#  echo 'newrelic.daemon.address="@newrelic-daemon"' >> /home/vcap/app/php/etc/php.ini
#  sed -E 's/^(newrelic\.daemon\.port.*)/; \1/' -i /home/vcap/app/php/etc/php.ini
