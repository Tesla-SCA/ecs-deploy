FROM docker:17.06.0-ce-git

# Install packges needed
RUN apk --no-cache add ca-certificates curl bash jq py2-pip && \
    pip install awscli

COPY ecs-deploy /ecs-deploy
RUN chmod a+x /ecs-deploy

COPY test.bats /test.bats
COPY run-tests.sh /run-tests.sh
RUN chmod a+x /run-tests.sh