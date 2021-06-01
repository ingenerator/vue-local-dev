FROM node:14-alpine

# Mount your vuejs root to /workspace. Or, if the vue app is below the project root, mount
# the project root to /workspace and then set the working directory to the correct
# subdirectory path.
WORKDIR    /workspace

# 8080 is the default port for `yarn serve`
EXPOSE 8080

RUN yarn global add @vue/cli @vue/cli-service-global \
    && apk --no-cache add git

COPY entrypoint.sh /vue-dev/entrypoint.sh

LABEL org.opencontainers.image.source=https://github.com/ingenerator/vue-local-dev

# Runs `yarn install` to make sure deps are up to date, then runs your command
ENTRYPOINT ["/vue-dev/entrypoint.sh"]
