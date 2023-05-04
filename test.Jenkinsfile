pipeline {
    agent any
    stages {
        stage('Stage 1') {
            steps {
                script {
                    // Capture input directive approval logs to a file
                    // withInputTimeout(time: 30, unit: 'MINUTES') {
                        withEnv(["BUILD_LOG_FILE=${env.WORKSPACE}/build.log"]) {

                                input message: 'Do you want to proceed?', submitter: 'user1', id: 'input-id' | tee -a ${BUILD_LOG_FILE}

                        }
                    // }
                }
            }
        }
    }
}
