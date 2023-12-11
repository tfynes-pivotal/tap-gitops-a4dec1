echo
echo Ensure ./setup-tap.sh has been run to sops-encrypt sensitive files.
echo
echo WARNING: Ensure unencrypted sensitive files removed from repo
echo  ./accelerator.log
echo  ./accelerator-assets/secrets-to-seal/*
echo
echo Continue to create GitHub TAP GitOps Repo tap-gitops-a4dec1
echo     https://github.com/tfynes-pivotal/tap-gitops-a4dec1
echo

read -r -p "Unencrypted Files Removed? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
git init -b main
git add .
git commit -am "."
gh repo create tap-gitops-a4dec1 --private
git remote add origin https://github.com/tfynes-pivotal/tap-gitops-a4dec1
git branch -M main
git push -u origin main
echo
echo
echo TAP GitOps GitHub repo created. 
echo
echo cd  ./clusters/taplab 
echo target appropriate k8s cluster and 
echo run ./tanzu-sync/scripts/deploy.sh to continue
echo 
fi