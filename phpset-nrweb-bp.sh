#!/bin/bash

echo 'newrelic.daemon.collector_host="gov-collector.newrelic.com"' >> /home/vcap/app/php/etc/php.ini
echo 'newrelic.daemon.loglevel="debug"' >> /home/vcap/app/php/etc/php.ini
echo 'newrelic.loglevel="verbosedebug"' >> /home/vcap/app/php/etc/php.ini

echo 'newrelic.daemon.ssl_ca_path="/etc/ssl/certs/"' >> /home/vcap/app/php/etc/php.ini
echo 'newrelic.daemon.ssl_ca_bundle="/etc/ssl/certs/ca-certificates.crt"' >> /home/vcap/app/php/etc/php.ini

#app=nrweb-bp

#$echo cf ssh $app -c "echo 'newrelic.daemon.collector_host="gov-collector.newrelic.com"' >> /home/vcap/app/php/etc/php.ini"
#$echo cf ssh $app -c "echo 'newrelic.daemon.loglevel="debug"' >> /home/vcap/app/php/etc/php.ini"
#$echo cf ssh $app -c "echo 'newrelic.loglevel="verbosedebug"' >> /home/vcap/app/php/etc/php.ini"

#$echo cf ssh $app -c "echo 'newrelic.daemon.proxy="http://xxxyyyzzz@dev-proxy.apps.internal:61443"' >> /home/vcap/app/php/etc/php.ini"
#$echo cf ssh $app -c "echo 'newrelic.daemon.ssl_ca_path="/etc/ssl/certs/"' >> /home/vcap/app/php/etc/php.ini"
#$echo cf ssh $app -c "echo 'newrelic.daemon.ssl_ca_bundle="/etc/ssl/certs/ca-certificates.crt"' >> /home/vcap/app/php/etc/php.ini"
