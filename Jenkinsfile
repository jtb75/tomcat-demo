node {
        stage('Clone') {
                container('build') {
                        echo 'Cloning Repo..'
                        sh """
                        git clone https://github.com/jtb75/tomcat-demo.git
                        """
                }
        }
        stage ('Build') {
                container('build') {
                        echo 'Building Image..'
                        sh """
                        docker build -t tomcat-demo:$BUILD_NUMBER tomcat-demo
                        """
                }
        }
        stage ('Scan') {
                container('build') {
                        echo 'Scan for Compliance and Vulnerabilities..'
                        prismaCloudScanImage ca: '', cert: '',
                                dockerAddress: 'unix:///var/run/docker.sock',
                                ignoreImageBuildTime: true,
                                image: 'tomcat-demo:$BUILD_NUMBER',
                                key: '',
                                logLevel: 'info',
                                podmanPath: '',
                                project: '',
                                resultsFile: 'prisma-cloud-scan-results.json'
                        prismaCloudPublish resultsFilePattern: 'prisma-cloud-scan-results.json'
                        sh """
                        rm prisma-cloud-scan-results.json
                        """
                }
        }
        stage ('Test') {
                echo 'Running Test Harness..'
                sh """
                sleep 2
                """
        }
        stage ('Push') {
                echo 'Push Image to Registry..'
                sh """
                sleep 2
                """
        }
        stage ('Cleanup') {
                echo 'Cleaning up Image..'
        }
}
