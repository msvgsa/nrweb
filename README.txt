
A simple buildpack based app, to test connection to New Relic

In theory, this is the simplest (?) implementation of NewRelic on Cloud.gov.  
We just instantiate a deployment of the CG php buildpack, using CG's  "NEWRELIC_LICENSE: " env field in manifest.yml

What could go wrong?

Contents:
1. manifest.yml            ### Set up a minimal app w / NEWRELIC_LICENSE
2. .bp-config/options.json ### Specify php 8 to prevent warnings, specify our startup script
3. web/index.html          ### give http requests something to read
4. php-set-nrweb-bp.sh     ### add entries to php.ini
5. make-traffic.sh         ### create some activity for NewRelic to log
6. README.txt              ### this file
7. Makefile                ### run commands systematically for testing

###############################################################
###                    PLEASE READ ME                       ###
### and check the Makefile for the cf commands we are using ###
###############################################################
0.  Environment setup:
   a. Add your NewRelic license key to manifest.yml
   b. Change the "space" and "org" variables at the top of the Makefile to point to your testing space on CG.

1. Deploy the app and run the tests in one shot:
    a. make full-test | tee logs/my.log

2. Or, make delete-app-bp deploy-app-bp

3. ... then, Wait about 5 minutes

4. ... and finally, create some traffic then look at newrelic.log and newrelic-daemon.log:
    a. make test-app-bp
    c. make get-newrelic-logs-bp | tee logs/my.log
