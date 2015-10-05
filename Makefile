ubuntu1504: roles_present ansible_ok
	packer validate ubuntu1504.json
	packer build ubuntu1504.json

roles_present:
	ansible-galaxy install -r requirements.txt --force

ansible_ok:
	rm -f inventory
	echo 'localhost connection=local' > inventory
	ansible-playbook ansible/main.yml -i inventory --syntax-check
	rm inventory
