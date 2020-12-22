node {
        stage('Clone') {
                echo 'Cloning Repo..'
                sh """
                git clone https://github.com/jtb75/tomcat-demo.git
                """
        }
        stage ('Build') {
                echo 'Building Image..'
                sh """
                ls -dl /usr/bin/docker
                ls -dl /var/run/docker.sock
                ls -l
                /usr/bin/docker build -t tomcat-demo:$BUILD_NUMBER tomcat-demo
                """
        }
        stage ('Scan') {
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
                sh """
                docker rmi tomcat-demo:$BUILD_NUMBER
                """
        }
}
