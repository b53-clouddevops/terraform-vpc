// @Library('roboshop-shared-library@main') _
// env.REPONAME="terraform-vpc"
// terraform()

// @Library('pipeline-utility-steps') _

// STAGE_R_LOG_FILE = 'stage_R.log'

    // pipeline {
    //     agent any 
    //     parameters { 
    //         choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Chose the environment') 
    //         choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Chose Apply or Destroy') 
    //     }
    //     options {
    //         ansiColor('xterm')
    //     }
    //     stages {
    //         stage('Terraform Init') {
    //             steps {
    //                 sh "terrafile -f env-${ENV}/Terrafile"
    //                 sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
    //             }
    //         }
    //         stage('Terraform Plan') {
    //             steps {
    //                 sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars"
    //             }
    //         }

    //         stage('R Did you review the plan?') {
    //             // input {
    //             //     message 'Did you review'
    //             //     parameters {
    //             //         booleanParam(name: 'Apply?', defaultValue: false, description: 'True to proceed further')
    //             //     }
    //             // }    
    //                 steps {
    //                     input message: 'Approve the build?',
    //                     submitter: currentUser(),
    //                     approvers: ['alice', 'bob']
    //                 }              
    //             // script {
    //             //     tee(STAGE_R_LOG_FILE) {
    //             //         sh "echo Proceeding To Apple"
    //             //         echo 'print some Stage_PLAN log content..'
    //             //         }
    //             //     }
    //             // }
    //         }

    //         stage('Terraform Apply ') {
    //             steps {
    //                 // script {
    //                 //     // search log file for 'Stage_A'
    //                 //     regex = java.util.regex.Pattern.compile('some (Stage_PLAN) log')
    //                 //     matcher = regex.matcher(readFile(STAGE_R_LOG_FILE))
    //                 //     if (matcher.find()) {
    //                 //         echo "found: ${matcher}"
    //                 //     }
    //                 // }
    //                 sh "terraform ${ACTION} -var-file=env-${ENV}/${ENV}.tfvars -auto-approve"
    //                 }
    //             }
    //         }
    //     }



pipeline {
    agent any
    
    stages {
        stage('Stage 1') {
            steps {
                input message: 'Proceed with Stage 1?', submitter: 'admin', id: 'stage1input'
                sh "echo I am stage 1"
            }
        }
        stage('Stage 2') {
            steps {
                script {
                    def stage1approvers = input(id: 'stage1input', message: 'Approve Stage 1:', submitterParameter: 'stage1approvers')
                    def stage2approvers = input(message: 'Approve Stage 2:', submitterParameter: 'stage2approvers')
                    
                    def allApprovers = new HashSet()
                    allApprovers.addAll(stage1approvers)
                    allApprovers.addAll(stage2approvers)
                    
                    if (allApprovers.size() < (stage1approvers.size() + stage2approvers.size())) {
                        error "Duplicate approvers found"
                    }
                }
                sh "echo I am stage 2"
            }
        }
    }
}

// In this example, the
// input
// step is used to request approval from the users specified in the
// submitter
// or
// submitterParameter
// parameter. In the second stage, the script creates sets for the approvers in each stage and adds them to a combined set. The
// HashSet
// class is used to automatically remove duplicates. If the combined set size is less than the sum of the sizes of the individual sets, 
// it means there were duplicates, and an error is thrown.





















