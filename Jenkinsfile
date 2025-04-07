pipeline {
    agent any  // Runs on any available agent (machine) in Jenkins

    environment {
        DOCKER_USERNAME = credentials('dockerhub-username') // Use Jenkins secret for Docker Hub username
        DOCKER_PASSWORD = credentials('dockerhub-password') // Use Jenkins secret for Docker Hub password
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out the code from GitHub"
                checkout scm
            }
        }

        stage('Verify Docker Installation') {
            steps {
                echo "Verifying Docker Installation..."
                sh 'docker --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker Image"
                script {
                    // Build the Docker image
                    sh 'docker build -t my-c-python-project .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                echo "Running Tests"
                script {
                    // Run the container and execute tests
                    sh 'docker run my-c-python-project'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                echo "Pushing Docker Image to Docker Hub"
                script {
                    // Login to Docker Hub using credentials stored in Jenkins
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    // Tag the image with the Docker Hub repository name
                    sh 'docker tag my-c-python-project adminch001/my-c-python-project'
                    // Push the image to Docker Hub
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
