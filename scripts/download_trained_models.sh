mkdir -p mars

if [ -n "${DROPBOX_LINK_PASSWORD}" ]; then
    curl -X POST https://content.dropboxapi.com/2/sharing/get_shared_link_file \
    --header "Authorization: Bearer ${DROPBOX_ACCESS_TOKEN}" \
    --header "Dropbox-API-Arg: {\"path\":\"/cas.mar\",\"url\":\"https://www.dropbox.com/scl/fi/st47mooiv304g7vvpfrao/cas.mar?rlkey=5tpt6z2zh4cq5rv14pbm3ed8r&dl=0\", \"link_password\":\"${DROPBOX_LINK_PASSWORD}\"}" \
    -o ./mars/cas.mar
fi
