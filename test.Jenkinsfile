pipeline {
    agent any
    stages {
        stage('Stage 1') {
            steps {
                    sh "echo This is stage 1"
                    sh "ls -latr ${WORKSPACE}"
            }
        }
        stage('Stage 2') {
            steps {
                    sh "echo This is stage 2"
            }
        }
    }
}

