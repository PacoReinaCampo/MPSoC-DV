# DEPLOY

In the context of DevOps, the "DEPLOY" phase refers to the process of releasing and installing software or updates into the production environment, making it accessible to end-users. Deployment is a critical stage in the software delivery lifecycle, as it involves transitioning code from development and testing environments to the live production environment. Here's a breakdown of what typically happens during the DEPLOY phase:

1. **Infrastructure Provisioning**: Before deploying the software, the necessary infrastructure must be provisioned or configured to support the application. This may involve setting up servers, databases, networking components, and other resources required for hosting and running the application in the production environment. Infrastructure as Code (IaC) tools like Terraform or AWS CloudFormation automate the provisioning process, ensuring consistency and reproducibility across environments.

2. **Configuration Management**: Configuration settings for the application, such as database connection strings, API endpoints, and environment-specific parameters, need to be configured correctly for the production environment. Configuration management tools like Ansible, Puppet, or Chef automate the management and deployment of configuration changes, ensuring that the application behaves consistently across different environments.

3. **Artifact Deployment**: Software artifacts, such as compiled binaries, container images, or package files, are deployed to the production environment during the DEPLOY phase. Automated deployment pipelines, orchestrated by continuous integration/continuous deployment (CI/CD) tools like Jenkins, GitLab CI/CD, or CircleCI, streamline the deployment process, enabling fast and reliable releases. Deployment strategies such as rolling updates, blue-green deployments, or canary releases are employed to minimize downtime and user impact during deployment.

4. **Database Migrations**: If the application relies on a database, database schema changes or migrations may need to be applied as part of the deployment process. Database migration tools like Flyway or Liquibase automate the execution of database scripts and ensure that database changes are applied consistently across environments. Careful planning and testing of database migrations are crucial to prevent data loss or corruption during deployment.

5. **Health Checks and Monitoring**: Before making the deployed application available to end-users, health checks and monitoring mechanisms are put in place to ensure that the application is functioning correctly. Health checks verify that the application is responsive and able to handle requests, while monitoring tools like Prometheus, Grafana, or Datadog provide real-time insights into application performance, resource utilization, and error rates. Automated rollback mechanisms are also set up to revert to the previous version in case of deployment failures or performance issues.

6. **Smoke Testing**: Smoke tests are performed after deployment to validate that the critical functionalities of the application are working as expected. These tests focus on the most essential features and workflows to quickly identify any deployment issues or regressions. Automated smoke tests are typically integrated into the deployment pipeline and executed automatically after deployment to ensure the stability of the deployed application.

7. **Post-Deployment Activities**: After successful deployment, post-deployment activities such as updating documentation, notifying stakeholders, and conducting user acceptance testing (UAT) may be necessary to ensure a smooth transition to the new version of the application. Feedback from users and stakeholders is collected to identify any issues or areas for improvement, which can inform future development iterations.

By automating and standardizing the deployment process, DevOps teams can accelerate the delivery of software updates, reduce the risk of errors, and improve the overall reliability and performance of the deployed application. The DEPLOY phase is an integral part of the DevOps lifecycle, enabling organizations to deliver value to end-users quickly and efficiently while maintaining a stable and secure production environment.

![Global Dependences](assets/chapter6/dependences-global.svg){width=10cm}

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

```
# Install FuseSoC
pip3 install --upgrade --user fusesoc

# Uninstall FuseSoC
pip3 uninstall fusesoc

# Environment FuseSoC
export PATH=~/.local/bin:$PATH

# Check FuseSoC version
fusesoc --version

# Folder
rm -rf workspace
mkdir workspace
cd workspace

# Start
fusesoc library add fusesoc-cores https://github.com/fusesoc/fusesoc-cores
fusesoc core list

# Simulation FuseSoC < 2.0
fusesoc sim --sim=verilator mor1kx-generic
fusesoc sim --sim=verilator mor1kx-generic --elf-load hello.elf

# Simulation FuseSoC 2.0
fusesoc run --target=sim i2c
```

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
