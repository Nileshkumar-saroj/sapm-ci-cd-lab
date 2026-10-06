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
            when {
                branch 'main'
            }
            steps {
                bat 'call deploy.bat'
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully.'
            echo 'Application deployed at http://localhost:8081'
        }

        failure {
            echo 'Pipeline failed. Check the console output for details.'
        }
    }
}
