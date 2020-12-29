env.registry = 'harbor.ng20.org/demos/tomcat-demo'
env.registryCredential = 'harbor-creds'
node {
        stage('Clone') {
                echo 'Cloning Repo..'
                git 'https://github.com/jtb75/tomcat-demo.git'
                sh """
                sed -i 's/BUILDNUMBER/$BUILD_NUMBER/' Dockerfile
                """
        }
        stage ('Build') {
                container('build') {
                        echo 'Building Image..'
                        sh 'echo $registry'
                        docker.build "harbor.ng20.org/demos/tomcat-demo:$BUILD_NUMBER"
                }
        }
        stage ('Scan') {
                container('build') {
                        echo 'Scan for Compliance and Vulnerabilities..'
/*                         
                        prismaCloudScanImage ca: '', cert: '', dockerAddress: 'unix:///var/run/docker.sock',
                                image: 'tomcat-demo:$BUILD_NUMBER', key: '',
                                logLevel: 'info', podmanPath: '', project: '',
                                resultsFile: 'prisma-cloud-scan-results.json'
                        prismaCloudPublish resultsFilePattern: 'prisma-cloud-scan-results.json'
*/
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
                container('build') {
                        echo 'Cleaning up Image..'
                        //sh """
                        //docker rmi harbor.ng20.org/demos/tomcat-demo:$BUILD_NUMBER
                        //"""
                }
        }
}
