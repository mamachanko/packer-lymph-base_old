box: roles_present ansible_ok
	packer validate lymph_base.json
	packer build lymph_base.json

roles_present:
	ansible-galaxy install -r requirements.txt --force

ansible_ok:
	rm -f inventory
	echo 'localhost connection=local' > inventory
	ansible-playbook ansible/main.yml -i inventory --syntax-check
	rm inventory
