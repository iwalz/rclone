FROM rclone/rclone

ENV S3_REGION us-east-1
ENV S3_ENV_AUTH false
ENV S3_LOCATION_CONSTRAINT us-east-1
ENV S3_ACL private

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]