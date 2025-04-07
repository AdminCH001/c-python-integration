pipeline {
    agent any
    stages {
        stage('Check Docker') {
            steps {
                script {
                    // Full path to Docker executable
                    echo "Checking Docker version..."
                    sh '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" --version'
                }
            }
        }
    }
}
