dev:
	rm -rf .terraform*
	terrafile -f env-dev/Terrafile
	git pull
	#terraform init
	#terraform apply -auto-approve


prod:
	rm -rf .terraform*
	terrafile -f env-prod/Terrafile
	git pull
	#terraform init
	#terraform apply -auto-approve

dev-destroy:
	rm -rf .terraform*
	terrafile -f env-dev/Terrafile
	git pull
	#terraform init
	#terraform destroy -auto-approve

prod-destroy:
	rm -rf .terraform*
	terrafile -f env-prod/Terrafile
	git pull
	#terraform init
	#terraform destroy -auto-approve