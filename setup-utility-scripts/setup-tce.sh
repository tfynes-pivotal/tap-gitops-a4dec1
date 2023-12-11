export TAP_VERSION=1.7.0
export TDS_VERSION=1.12.0

#! Deploy Tanzu Cluster Essentials
# if data.values.platformRegistryLocation == 'customPlatformRegistrySelection':
export INSTALL_REGISTRY_HOSTNAME= #@ data.values.customPlatformRegistryUrl
export INSTALL_REGISTRY_USERNAME= #@ data.values.customPlatformRegistryUsername
export INSTALL_REGISTRY_PASSWORD= #@ data.values.customPlatformRegistryPassword
export INSTALL_BUNDLE=$INSTALL_REGISTRY_HOSTNAME/tce-packages/cluster-essentials-bundle@sha256:2f538b69c866023b7d408cce6f0624c5662ee0703d8492e623b7fce10b6f840b 
# else:
export INSTALL_REGISTRY_HOSTNAME= 'registry.tanzu.vmware.com'
export INSTALL_REGISTRY_USERNAME= #@ data.values.tanzunetUsername
export INSTALL_REGISTRY_PASSWORD= #@ data.values.tanzunetPassword
export INSTALL_BUNDLE=$INSTALL_REGISTRY_HOSTNAME/tanzu-cluster-essentials/cluster-essentials-bundle@sha256:2f538b69c866023b7d408cce6f0624c5662ee0703d8492e623b7fce10b6f840b 
# end 
./install_tce.sh