#!/bin/bash
function install_remote_charts() {
    CFG_FILE="${1}"

    if [[ -n $(yq '.repo' ) ]]; then
        REPO_NAME=$(yq '.repo.name' ${CFG_FILE})
        REPO_URL=$(yq '.repo.url' ${CFG_FILE})
        set -x
        helm repo add ${REPO_NAME} ${REPO_URL}
        { set +x; } 2>/dev/null
    fi

    DEPLOYMENT_VERSION=$(yq '.deployment.version' ${CFG_FILE})
    DEPLOYMENT_RELEASE=$(yq '.deployment.release' ${CFG_FILE})
    DEPLOYMENT_NAMESPACE=$(yq '.deployment.namespace' ${CFG_FILE})
    DEPLOYMENT_PATH=$(yq '.deployment.path' ${CFG_FILE})
    DEPLOYMENT_OCI=$(yq '.deployment.oci' ${CFG_FILE})
    if [[ "null" != "${DEPLOYMENT_PATH}" ]]; then
        set -x
        helm upgrade --install "${DEPLOYMENT_RELEASE}" "${REPO_NAME}/${DEPLOYMENT_PATH}" --version "${DEPLOYMENT_VERSION}" --namespace "${DEPLOYMENT_NAMESPACE}" --create-namespace
        { set +x; } 2>/dev/null
    else
        set -x
        helm upgrade --install "${DEPLOYMENT_RELEASE}" "${DEPLOYMENT_OCI}" --version "${DEPLOYMENT_VERSION}" --namespace "${DEPLOYMENT_NAMESPACE}" --create-namespace
        { set +x; } 2>/dev/null
    fi
}

if [[ -n "${1}" ]]; then
    install_remote_charts "${1}"
else
    for file in *.yaml; do
        echo "Installing remote charts: ${file}"
        install_remote_charts "${file}"
    done
fi