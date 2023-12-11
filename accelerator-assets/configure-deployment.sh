
# if [ CREATE_AGE_KEY = 'create-key' ]
# then
# age-keygen > secrets-to-seal/key.txt
# echo SOPS ENCRYPTION KEY CREATED 
# fi


pushd ./secrets-to-seal
./encrypt-secrets.sh
popd

echo
echo SOPS ENCRYPTION KEY MOVED TO TOP LEVEL OF GITREPO FOLDER 


echo INITIALIZE SOPS ENV VAR AS FOLLOWS
echo
echo "export SOPS_AGE_KEY=\$(cat $(pwd)/../key.txt)"

echo "(/key.txt added to .gitignore)"
echo

mv ./secrets-to-seal/key.txt ../

mv ./secrets-to-seal/config/tanzu-registry-secret.sops.yaml ../clusters/taplab/cluster-config/config/
mv ./secrets-to-seal/config/user-registry-dockerconfig.sops.yaml ../clusters/taplab/cluster-config/config/
mv ./secrets-to-seal/config/lsp-push-credentials.sops.yaml ../clusters/taplab/cluster-config/config/
mv ./secrets-to-seal/config/workload-git-auth.sops.yaml          ../clusters/taplab/cluster-config/config/
mv ./secrets-to-seal/config/git-auth.sops.yaml          ../clusters/taplab/cluster-config/config/
mv ./secrets-to-seal/config/git-auth-install.sops.yaml          ../clusters/taplab/cluster-config/config/

mv ./secrets-to-seal/dependent-resources/sso-credentials-secret.sops.yaml ../clusters/taplab/cluster-config/dependent-resources/

mkdir -p ../clusters/taplab/tanzu-sync/app/sensitive-values
mv ./secrets-to-seal/tanzu-sync/tanzu-sync-values.sops.yaml ../clusters/taplab/tanzu-sync/app/sensitive-values/

# mv ./secrets-to-seal/tanzu-sync/registry-credentials.sops.yaml ../clusters/taplab/tanzu-sync/config/.tanzu-managed/

mv ./secrets-to-seal/values/tap-sensitive-values.sops.yaml ../clusters/taplab/cluster-config/values/

if [ tlsManual = 'tlsManual' ]
then
mv ./secrets-to-seal/tls/taplab-tls-certs.sops.yaml ../clusters/taplab/cluster-config/config/
fi

mv ./non-sensitive-config/tap-non-sensitive-values.yaml             ../clusters/taplab/cluster-config/values/
if [ false = 'true' ]
then
mv ./non-sensitive-config/kapp-controller-ca-cert.yaml             ../clusters/taplab/cluster-config/config/
#mv ./non-sensitive-config/azure-ca-cert.yaml  ../clusters/taplab/cluster-config/config/
fi


echo "DELETE /accelerator-log.md BEFORE PUSHING TO REPO AS IT CONTAINS SENSITIVE VALUES"
echo


# echo '#@ load("@ytt:data", "data")' | cat - x.yaml > /tmp/x && mv /tmp/x ./x.yaml
# KEY=$(cat ./key.txt) ytt -f ./prefix.yaml -v newAgeKeyContent="$KEY"
