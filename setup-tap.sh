# SCRIPT TO COMPLETE TAP INSTALLATION
# REQUIRES following CLIs
# age
# kubectl ( pre-connected to target k8s cluster with tanzu-essentials pre-installed thereon)
#
# environment variables used
# TanzuNet Creds
#
# DockerHub Creds
#
# GitHub Creds
#
# tanzu-registry-secret.sops.yaml
# user-registry-dockerconfig.sops.yaml
# workload-git-auth.sops.yaml
# sso-credentials-secret.sops.yaml
# tap-sensitive-values.sops.yaml 


pushd ./accelerator-assets
./configure-deployment.sh
popd

echo Run ./initialize-repo.sh to to continue