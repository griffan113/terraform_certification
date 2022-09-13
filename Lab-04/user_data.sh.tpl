#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install httpd

cat <<EOF > /var/www/html/index.html
<html>
  <h1>
    Built by Terraform
  </h1>
  <br>

  Server Owner is: ${owner}

  %{ for purpuse in server_purposes ~}
    <p>One of the server purpuse is ${purpuse}</p>
  %{ endfor ~}
</html>
EOF

sudo systemctl restart httpd
