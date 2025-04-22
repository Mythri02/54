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
                echo 'Cleaning up...'
                bat "docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME}" // use 'sh' for Linux
            }
        }
    }

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
