pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm.cmd install'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'npm.cmd test'
            }
        }

        stage('Deploy') {
            steps {
                bat 'call deploy.bat'
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully.'
        }

        failure {
            echo 'CI/CD pipeline failed. Check the console output.'
        }
    }
}
