
A simple buildpack based app, to test connection to New Relic

Contents:
1. manifest.yml            ### Set up a minimal app
2. .bp-config/options.json ### Specify php 8 to prevent warnings
3. web/index.html          ### give http requests something to read
4. make-traffic.sh         ### create some activity for NewRelic to log
5. php-set-nrweb-bp.sh     ### add entries to php.ini
6. README.txt              ### this file

*** Make sure you add a real NewRelic License Key to manifest.yml

### Test in any space belonging to the security group 'public_networks_egress'


1. Deploy the app w/ cf push
2. Create some traffic w/ cf ssh nrweb-bp -c app/make-traffic.sh
3. I would expect to see some activity in my NR dashboard at this point, but I do not see any.



