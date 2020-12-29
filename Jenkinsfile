node {
        environment {
                registry = "harbor.ng20.org/apache"
                registryCredential = 'harbor-creds'
        }

        stage('Clone') {
                echo 'Cloning Repo..'
                git 'https://github.com/jtb75/tomcat-demo.git'
                def WORKSPACE = pwd
                echo "Current workspace is $WORKSPACE"
                sh """
                #git clone https://github.com/jtb75/tomcat-demo.git
                pwd
                #sed -i 's/BUILDNUMBER/$BUILD_NUMBER/' tomcat-demo/Dockerfile
                """
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
/*                        prismaCloudScanImage ca: '', cert: '', dockerAddress: 'unix:///var/run/docker.sock',
                                image: 'tomcat-demo:$BUILD_NUMBER', key: '',
                                logLevel: 'info', podmanPath: '', project: '',
                                resultsFile: 'prisma-cloud-scan-results.json'
                        prismaCloudPublish resultsFilePattern: 'prisma-cloud-scan-results.json'
*/                }
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
                container('build') {
                        echo 'Cleaning up Image..'
                        sh """
                        docker rmi tomcat-demo:$BUILD_NUMBER
                        """
                }
        }
}
