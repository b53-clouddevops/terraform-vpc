pipeline {
    agent any
    stages {
        stage('Stage 1') {
            steps {
                    sh "echo This is stage 1"
                    sh "ls -latr"
                    sh "ls -latr ${WORKSPACE}"
                    sh "date"
                    sh "cat $WORKSPACE/build.log"
            }
        }
        stage('Stage 2') {
            steps {
                    sh "echo This is stage 2"
                    sh "cat $WORKSPACE/build.log"
            }
        }
    }
}

