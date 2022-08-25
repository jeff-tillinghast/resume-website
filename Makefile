.PHONY: build

build:
	sam build

deploy-infra:
	sam build && aws-vault exec jeff --no-session -- sam deploy

deploy-site:
	aws-vault exec jeff --no-session -- aws s3 sync ./html s3://jtillinghast-resume-website-v3

invoke-put:
	sam build && aws-vault exec jeff --no-session -- sam local invoke PutFunction

invoke-get:
	sam build && aws-vault exec jeff --no-session -- sam local invoke GetFunction
