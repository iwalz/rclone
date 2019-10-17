#!/bin/sh

rm -rf /root/.config/rclone/
mkdir -p /root/.config/rclone/
touch /root/.config/rclone/rclone.conf
echo "Creating SFTP config ... "
./rclone config create SFTP sftp host ${SFTP_HOST} user ${SFTP_USER} pass ${SFTP_PASSWORD} > /dev/null
echo "Creating S3 config ... "
./rclone config create S3 s3 provider AWS access_key_id ${S3_ACCESS_KEY_ID} secret_access_key ${S3_SECRET_ACCESS_KEY} region ${S3_REGION} endpoint ${S3_ENDPOINT} env_auth ${S3_ENV_AUTH} location_constraing "" server_side_encryption "" acl ${S3_ACL} > /dev/null

echo "Executing rclone -v --sftp-use-insecure-cipher $@"
./rclone --sftp-use-insecure-cipher "$@"
