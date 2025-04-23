pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-app-image'
        CONTAINER_NAME = 'my-app-container'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Declarative checkout of the Jenkinsfile itself
                checkout scm
            }
        }

        stage('Clone Repo') {
            steps {
                // Explicit clone to main branch
                git url: 'https://github.com/Mythri02/54.git', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Installing dependencies...'
                bat 'npm install' // use 'sh' for Linux systems
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Running tests...'
                bat 'npm test' // use 'sh' for Linux systems
            }
        }

        stage('Build Docker Images') {
            steps {
                echo 'Building Docker image...'
                bat "docker build -t ${IMAGE_NAME} ." // use 'sh' for Linux
            }
        }

        stage('Run Containers') {
            steps {
                echo 'Running Docker container...'
                bat "docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}" // use 'sh' for Linux
            }
        }

       stage('Cleanup') {
    steps {
        echo 'Starting cleanup process...'
        script {
            try {
                def stopOutput = bat(script: "docker stop %CONTAINER_NAME%", returnStdout: true).trim()
                echo "Docker stop output: ${stopOutput}"

                def rmOutput = bat(script: "docker rm %CONTAINER_NAME%", returnStdout: true).trim()
                echo "Docker rm output: ${rmOutput}"

                echo 'Cleanup completed successfully.'
            } catch (err) {
                echo "Cleanup failed: ${err}"
            }
        }
    } // <--- this closes steps
}     // <--- this closes stage



    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo 'Build succeeded.'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
