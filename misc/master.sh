password='amazing'
file='/etc/puppetlabs/puppet/validate_csr.sh'
 
cat << EOF > $file
#!/bin/bash
 
# 2 second sleep to overcome race condition sometimes resulting in error 500 on server while writing CSR
sleep 2
 
# define the shared secret we will accept to authenticate identity
SHARED_SECRET="$password"
CA_REQUESTS_PATH="/etc/puppetlabs/puppet/ssl/ca/requests"
 
# capture the certname (hostname) used for the request
CERT_NAME=\$1
 
# feed STDIN (file descriptor 0) to the openssl command and pipe
# the output to grep to get the sharedSecret supplied by the agent
# capturing the value in a variable called AGENT_SECRET
AGENT_SECRET=\$(openssl req -noout -text -in \${CA_REQUESTS_PATH}/\${CERT_NAME}.pem | grep challengePassword | awk '{ print \$2 }' | tr -d ':')
 
# Exit script if challengePassword in csr does not match the SHARED_SECRET or is unset/empty
if [[ "\$AGENT_SECRET" != "\$SHARED_SECRET" ]] || [ -z \${AGENT_SECRET+x} ];
then
  exit 1
else
  exit 0
fi
 
EOF
 
chmod +x $file && chown puppet:puppet $file
echo '' > /etc/puppetlabs/puppet/autosign.conf  # disable autosign file
sed -i "s;autosign.*;autosign = $file;" "/etc/puppetlabs/puppet/puppet.conf"  # change the entry in puppet.conf if it exists
grep -q "autosign = $file" /etc/puppetlabs/puppet/puppet.conf || echo "autosign = $file" >> /etc/puppetlabs/puppet/puppet.conf  # add the entry in puppet.conf if doesn't exist
systemctl restart puppetserver