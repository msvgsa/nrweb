#
#
#

BP_APP=nrweb-bp
BP_SPACE=mark.vitek
BP_ORG=sandbox-gsa
#BP_SPACE=tool
#BP_PAPP=dev-proxy
#BP_ESPACE=shared-egress
#BP_EPORT=61443

set-space-bp:
	cf target -s $(BP_SPACE)

set-security-groups-bp: set-space-bp
	cf bind-security-group public_networks_egress $(BP_ORG) --lifecycle running --space $(BP_SPACE)
	cf bind-security-group public_networks_egress $(BP_ORG) --lifecycle staging --space $(BP_SPACE)

test-app-bp: set-space-bp
	-cf security-groups | grep $(BP_SPACE)
	-cf ssh $(BP_APP) -c "app/make-traffic.sh"
	-cf ssh $(BP_APP) -c "ping -c 2 www.google.com"
	-cf ssh $(BP_APP) -c "wget https://www.google.com"
	-cf ssh $(BP_APP) -c "ping -c 2 www.newrelic.com"
	-cf ssh $(BP_APP) -c "wget https://www.newrelic.com"
	-cf ssh $(BP_APP) -c "ls -l index.*"

get-newrelic-logs-bp:
	-cf ssh $(BP_APP) -c "cat app/logs/newrelic-daemon.log app/logs/newrelic.log"

ssh-app-bp: set-space-bp
	-cf ssh $(BP_APP)

delete-app-bp: set-space-bp
	-cf delete -r -f $(BP_APP)

deploy-app-bp: set-security-groups-bp
	cf push
	cf apps
	cf routes

play-the-waiting-game:
	echo "Sleeping for 5 minutes to allow the app to settle down"
	sleep 300

full-test: delete-app-bp deploy-app-bp play-the-waiting-game test-app-bp get-newrelic-logs-bp

#
# saved for container (vs buildpack) based testing
#
#delete-app-ct: set-space-ct
#	-cf delete-route app.cloud.gov --hostname $(BP_APP)
#	-cf remove-network-policy $(CT_APP) $(CT_PAPP) -s $(CT_ESPACE) --protocol tcp --port $(CT_EPORT)
#	-cf delete -r -f $(CT_APP)
#
#deploy-app-ct: set-space-ct
#	cf push
#	cd ../../.. && bin/cloudgov/setup-egress-for-apps $(CT_APP)
