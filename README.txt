
A simple buildpack based app, to test connection to New Relic

Contents:
1. manifest.yml            ### Set up a minimal app
2. .bp-config/options.json ### Specify php 8 to prevent warnings
3. web/index.html          ### give http requests something to read
4. make-traffic.sh         ### create some activity for NewRelic to log
5. php-set-nrweb-bp.sh     ### add entries to php.ini
6. README.txt              ### this file

### Test in any space belonging to the security group 'public_networks_egress' :
    cf target -o sandbox-gsa -s mark.vitek
    cf delete -r -f nrweb-bp
    cf push
    cf ssh nrweb-bp -c "app/make-traffic.sh"
    cf logs nrweb-bp --recent | tail -10
