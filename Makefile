#
#
#
#SPACE=tool
SPACE=mark.vitek
PAPP=dev-proxy
ESPACE=shared-egress
ESPACE=mark.vitek
EPORT=61443

BP_APP=nrweb-bp
BP_SPACE=$(SPACE)
BP_PAPP=$(PAPP)
BP_ESPACE=$(ESPACE)
BP_EPORT=$(EPORT)

CT_APP=nrweb-ct
CT_SPACE=$(SPACE)
CT_PAPP=$(PAPP)
CT_ESPACE=$(ESPACE)
CT_EPORT=$(EPORT)

set-space-bp:
	cf target -s $(BP_SPACE)

test-space-bp:
	-cf ssh $(BP_APP) -c "app/make-traffic.sh"
	-cf ssh $(BP_APP) -c "strace curl http://127.0.0.1:8080/index.html?1=5 2> strace.log"
	-cf logs $(BP_APP) --recent

ssh-app-bp:
	-cf ssh $(BP_APP)

#set-space-ct:
#	cf target -s $(CT_SPACE)

delete-app-bp: set-space-bp
#	-cf delete-route app.cloud.gov --hostname $(BP_APP)
#	-cf remove-network-policy $(BP_APP) $(BP_PAPP) -s $(BP_ESPACE) --protocol tcp --port $(BP_EPORT)
	-cf delete -r -f $(BP_APP)

deploy-app-bp: set-space-bp
	cf push
#	cd ../../.. && bin/cloudgov/setup-egress-for-apps $(BP_APP)

#delete-app-ct: set-space-ct
#	cf delete-route app.cloud.gov --hostname $(CT_APP)
#	cf remove-network-policy $(CT_APP) $(CT_PAPP) -s $(CT_ESPACE) --protocol tcp --port $(CT_EPORT)
#	cf delete $(CT_APP)

#deploy-app-bp: set-space-ct
#	cf push
#	cd ../../.. && bin/cloudgov/setup-egress-for-apps $(CT_APP)
