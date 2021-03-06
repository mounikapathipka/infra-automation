mkdir azagent;
cd azagent;
curl -fkSL -o vstsagent.tar.gz https://vstsagentpackage.azureedge.net/agent/2.206.1/vsts-agent-linux-x64-2.206.1.tar.gz;
tar -zxvf vstsagent.tar.gz; 
if [ -x "$(command -v systemctl)" ]; 
	then 
		./config.sh --deploymentgroup --deploymentgroupname "DevDeoploymentGroup" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/HDBFinancialServices/ --work _work --projectname 'Insurance' --runasservice; 

		sudo ./svc.sh install; sudo ./svc.sh start; 
else ./config.sh --deploymentgroup --deploymentgroupname "DevDeoploymentGroup" --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/HDBFinancialServices/ --work _work --projectname 'Insurance'; 

		./run.sh; fi