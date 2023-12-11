# TAP Installer (Experimental)

TAP installation configurator using Tanzu Accelerator to provide a tailored GitOps installation repo for the platform. 

Current version TAP/tbs-deps 1.7.0 / RMQ 1.5.1 / TDS 1.12.0

NOTE: "tanzu-sync/scripts/deploy.sh" script errors out but installation will continue and fully reconcile.


## Features
- Deploy, Configure and Load up a new TAP cluster without the need to edit / create configuration files!!
	- Deploy without any YAML editing!
- Platform Gitops Based TAP Deployment
- Platform GitOps Namespace provisioner configured
- Application GitOps Configured with auto-deployed demo suite

### Configuration Options
- Supported upstream platform binary registry locations
	- TanzuNet direct
	- Custom (Harbor)
- Supported platform target binary registry locations
	- DockerHub
	- Custom (Harbor tested with TAP, TBS-full-dependencies and TDS Repos mirrored)
- Dual supply-chain support
	- basic
	- test & scan 
- Dual TLS configuration Options
	- HTTP Solver for Automated ACME certificate configuration using LetsEncrypt (caution: rate-limited!)
	- Bring your own TLS wildcard certificate 
- Tanzu Data Services
	- PostgresQL Operator
	- Demo workload (petclinic deployed with service binding to in-namespace TDS postgres db)
- Spring Cloud Gateway and Spring API Portal 
	- Vault (helm deployed) integration for API-KEY manged microservice deployment support
- OKTA SSO protections for Spring API Portal
	- Required for Spring API-Portal API-Key management support
- Tiny TAP Overlay 
	- Allow for non-production full profile TAP cluster deployment into < 50% of typical requirements (1-2 x 16gb AKS nodes)
	- Selectively omit deployment of TLC / Eventing packages to further reduce resource requirements
- Private Registry support - provide self-signed certs for registry or intermediate CAs
- RMQ operator support allowing for 'drag and drop' "Where for dinner" deployment support

- Local Source Proxy auto-configuration for harbor & dockerhub image registries
    - work directly from your IDE.. generate workload via accelerator and auto-deploy for subsequent 'live-update' 5second iterations
	- select 'java debug' to connect remote debugger with breakpoint support to live-updating instance of running workload

## Installation Procedure
- Provide configuration values/secrets to tap-installer wizard
- Generate Accelerator, download & explode zip-archive
- Open console prompt & run ./setup-tap.sh
- optionally move/delete ./accelerator-log and ./accelerator-assets/secrets-to-seal assets
- run ./initialize-repo.sh to create new git repo and upload to new github.
- cd ./cluster/taplab
- Ensure kubectl is set to access target cluster & tanzu-cluster-essentials installed thereon
- run ./tanzu-sync/scripts/deploy.sh
- **Monitor for external IP created by TAP cluster contour - update DNS record when available**

	`kubectl -n tanzu-system-ingress get svc -w`

Optionally run k9s to watch TAP install and configuraiton on your target cluster





## Prerequisites
### External
- DNS Service with ability to map a wildcard DNS domain  to a given IP
- For  'bring your own certs' setup using letsEncrypt and Certbot, ability to record TXT records needed
### Configuration
- GitHub account with personal access token
- GitHub oAuth appplication (client ID & Secret)
- TanzuNet or custom registry credentials

### Required CLI Tools
- kubectl
- k9s (optional)
- az (if using azure / AKS)
- golang (sops cli dependency)
- sops
- kapp
- ytt
- age-keygen (optional)
- gh (optional)
- git

## Deployment Procedures
### Pre-work
- Deploy kubernetes cluster
- Deploy tanzu-cluster-essentials to cluster
- Authenticate / login from your workstation to GitHub
- Create a seal-secrets (sops) encryption key (using 'age-keygen" cli



## 17 Experimental
- updated provided pipeline.yaml to support both maven and gradle test&scan runs
- still working on test&scan in more than one namespace (currently default only)
- Removed TDS and RMQ explicit repo deployments - bitnami operator included
- updated Spring Petclinic to use a class-claim to dynamically provision and bind to bitnami postgres (much simpler!)
- Need to revisit for WFD wtih 1.7.0 as it's still using crossplane which uses full RMQ
