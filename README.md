# Cargill_TechRnd1
Azure Infra Automation Task


1> Create a GitHub Repository
2> Enable OIDC authentication from the GitHub Repo to an Azure subscription.
3> Create a GitHub environment called Development in the GitHub repository. 
4> Create terraform configuration code for provisioning an Azure VNet, Azure VM, and a Load Balancer in the GitHub Repository.
5> Create GitHub action automation workflows in the repository which will trigger a terraform plan against the Development environment ( Azure subscription above ) whenever a pull request is raised in the repo.
6> Similarly, the GitHub action workflow should apply and provision the changes of terraform code to the Development environment ( Azure subscription above) whenever the pull request is merged to the main branch. 
7> Once the Infrastructure is provisioned in Azure, Apply CIS Policies to ensure the security of the infrastructure and try to fix the non-compliances reported.  
