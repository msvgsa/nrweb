#
#
#

BP_APP=nrweb-bp
BP_SPACE=mark.vitek
#BP_SPACE=tool
#BP_PAPP=dev-proxy
#BP_ESPACE=shared-egress
#BP_EPORT=61443

set-space-bp:
	cf target -s $(BP_SPACE)

test-space-bp:
	-cf ssh $(BP_APP) -c "app/make-traffic.sh"
	-cf logs $(BP_APP) --recent | tail -15

ssh-app-bp:
	-cf ssh $(BP_APP)

delete-app-bp: set-space-bp
#	-cf delete-route app.cloud.gov --hostname $(BP_APP)
#	-cf remove-network-policy $(BP_APP) $(BP_PAPP) -s $(BP_ESPACE) --protocol tcp --port $(BP_EPORT)
	-cf delete -r -f $(BP_APP)

deploy-app-bp: set-space-bp
	cf push
#	cd ../../.. && bin/cloudgov/setup-egress-for-apps $(BP_APP)
