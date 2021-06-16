export db_address=12.34.56.78
export db_port=5555
export server_port=8888
./user-data.sh
output=$(curl "http://web-alb-1091122125.us-east-2.elb.amazonaws.com:$server_port")
if [[ $output == *"Deployed via Terraform by SkyeNets"* ]]; then
echo "Success! Got expected text from server."
else
echo "Error. Did not get back expected text
'Hello, World'."
fi