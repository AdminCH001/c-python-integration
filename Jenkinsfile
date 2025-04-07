pipeline {
    agent any  // Runs on any available agent (machine) in Jenkins

    environment {
        DOCKER_USERNAME = credentials('dockerhub-username') // Use Jenkins secret for Docker Hub username
        DOCKER_PASSWORD = credentials('dockerhub-password') // Use Jenkins secret for Docker Hub password
    }


    stages {

        stage('Check Docker') {
            steps {
                script {
                    sh 'docker --version'  // Check Docker version
                    sh 'docker info'  // Check Docker info
                }
            }
        }

        stage('Checkout') {
            steps {
                // Checkout the code from GitHub
                checkout scm
            }
        }

        stage('Verify Docker Installation') {
            steps {
                echo "Verifying Docker Installation..."
                sh 'docker --version'  // Check Docker version to ensure Docker is installed
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build the Docker image
                script {
                    echo "Building Docker image..."
                    sh 'docker build -t my-c-python-project .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                // Run tests inside the Docker container
                script {
                    echo "Running tests inside the Docker container..."
                    sh 'docker run my-c-python-project'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                // Push the Docker image to Docker Hub
                script {
                    echo "Pushing Docker image to Docker Hub..."
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker tag my-c-python-project adminch001/my-c-python-project'
                    sh 'docker push adminch001/my-c-python-project'
                }
            }
        }
    }

    post {
        always {
            // Clean up after the build, like stopping Docker containers if needed
            cleanWs()  // Cleans workspace if needed
        }
    }
}
