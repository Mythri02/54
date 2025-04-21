pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/Mythri02/54.git'
            }
        }

        stage('Build Docker Images') {
            steps {
                bat 'docker build -t my-app-image .'
            }
        }

        stage('Run Containers') {
            steps {
                bat 'docker-compose up -d'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Pipeline completed successfully.'
            }
        }
    }
}
