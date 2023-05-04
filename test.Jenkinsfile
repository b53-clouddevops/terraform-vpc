// pipeline {
//     agent any
//     stages {
//         stage('Stage 1') {
//             steps {
//                     sh "echo This is stage 1"
//                     sh "ls -latr"
//                     sh "ls -latr ${WORKSPACE}"
//                     sh "date"
//                     sh "cat $WORKSPACE/build.log"
//             }
//         }
//         stage('Stage 2') {
//             steps {
//                     sh "echo This is stage 2"
//                     sh "cat $WORKSPACE/build.log"
//             }
//         }
//     }
// }

﻿

stage('SIT Deployment ?'){
    try {
        steps{
            script 
            {
            def userInput
            userInput = input(
            id: 'Proceed1', message: 'SIT Deployment Approval', parameters: [
            [$class:
            'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please Confirm you agree with this']
            ])
            } catch(err) {
            }
            def user = err.getCauses ()[0].getUser()
            userInput = false
            echo "Aborted by: [${user}]"
        }
    }
}