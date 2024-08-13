# DEPLOY (RELEASE)

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

In DevOps, the "RELEASE" phase marks the transition of software from development and testing environments to production, making it available to end users. This phase is crucial for ensuring that new features, bug fixes, and improvements are delivered to users in a controlled and efficient manner. Here's a breakdown of what typically happens during the RELEASE phase:

1. **Deployment Automation**: Automating the deployment process is key to achieving consistent and reliable releases. DevOps teams use deployment automation tools and scripts to orchestrate the deployment of software artifacts from staging or testing environments to production environments. Automation helps minimize human error, reduce deployment time, and ensure consistency across deployments.

2. **Release Planning**: Before a release, teams conduct release planning to coordinate the activities and resources needed to deploy the software successfully. This includes scheduling the release window, coordinating with stakeholders, and identifying any dependencies or risks that may impact the release process.

3. **Release Packaging**: As part of the RELEASE phase, software artifacts are packaged and prepared for deployment to production environments. This may involve creating release packages containing compiled binaries, configuration files, documentation, and any other necessary components. Packaging ensures that the software is bundled together in a format that can be easily deployed and installed.

4. **Rollout Strategy**: DevOps teams develop rollout strategies to manage the deployment of new releases in production environments. Depending on the organization's risk tolerance and deployment requirements, teams may choose from various rollout strategies, such as blue-green deployments, canary releases, phased rollouts, or feature flags. These strategies allow teams to minimize the impact of potential issues and gradually introduce changes to users.

5. **Monitoring and Rollback Plans**: Monitoring the release process in real-time is essential for detecting and responding to any issues that may arise during deployment. DevOps teams implement monitoring tools and dashboards to track key metrics, such as application performance, error rates, and user feedback. Additionally, teams develop rollback plans to quickly revert to the previous release if unexpected issues occur, ensuring minimal disruption to users.

6. **Post-release Verification**: After a release is deployed to production, teams conduct post-release verification to ensure that the software is functioning as expected and meeting user needs. This may involve conducting smoke tests, user acceptance testing (UAT), and monitoring user feedback to validate the success of the release. Any issues or feedback gathered during this phase are addressed promptly through bug fixes or feature enhancements.

7. **Documentation and Communication**: Documentation and communication are essential aspects of the RELEASE phase. Teams document the changes introduced in the release, including new features, bug fixes, and known issues, to keep stakeholders informed. Additionally, teams communicate with users, customers, and internal stakeholders to announce the release, provide instructions for accessing new features, and gather feedback for future improvements.

By following a structured and automated release process, DevOps teams can deliver software to users quickly, reliably, and with minimal risk. The RELEASE phase ensures that new features and improvements are delivered in a controlled manner, allowing organizations to iterate and innovate while maintaining a stable and responsive production environment.

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

## QUALITY ASSURANCE

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....

### Ada Language

.. ....... ........ ........ ....... .. ........... ...... .... .. ...... ..... .. ..... .... ........ ... ...... . ... .... .. ......... ........... .... .... ........ .. .... . ..... ....... .... ... ........ .... ............ .. ... ... ....... .. ...... .... ... .... ....... .. ..... ... .... ....... ... ....... ......... ..... .......... ....... ..... ....... ... ....... ... ....... ..... ..... .... . ........ .. ... ..... ......... .. ........ ..... ....... .......... .......... ... ........ .. ... ..... .. ........ ..... .......... .... ... ...... .. .....
