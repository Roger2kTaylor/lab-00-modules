#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd 
cat > /var/www/html/index.html <<EOF
<h1>Deployed via Terraform by SkyeNets</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
<p>Server port: ${server_port}</p>
EOF

