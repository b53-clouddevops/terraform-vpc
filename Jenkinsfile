// @Library('roboshop-shared-library@main') _
// env.REPONAME="terraform-vpc"
// terraform()

// @Library('pipeline-utility-steps') _

STAGE_R_LOG_FILE = 'stage_R.log'

    pipeline {
        agent any 
        parameters { 
            choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Chose the environment') 
            choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Chose Apply or Destroy') 
        }
        options {
            ansiColor('xterm')
        }
        stages {
            stage('Terraform Init') {
                steps {
                    sh "terrafile -f env-${ENV}/Terrafile"
                    sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
                }
            }
            stage('Terraform Plan') {
                steps {
                    sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars"
                }
            }

            stage('R Did you review the plan?') {
                input {
                    message 'Did you review'
                    parameters {
                        booleanParam(name: 'Apply?', defaultValue: false, description: 'True to proceed further')
                    }
                }
                steps {                     
                script {
                    tee(STAGE_R_LOG_FILE) {
                        sh "echo Proceeding To Apple"
                        echo 'print some Stage_PLAN log content..'
                        }
                    }
                }
            }

            stage('Terraform Apply ') {
                steps {
                    script {
                        // search log file for 'Stage_A'
                        regex = java.util.regex.Pattern.compile('some (Stage_PLAN) log')
                        matcher = regex.matcher(readFile(STAGE_R_LOG_FILE))
                        if (matcher.find()) {
                            echo "found: ${matcher}"
                        }
                    }
                    sh "terraform ${ACTION} -var-file=env-${ENV}/${ENV}.tfvars -auto-approve"
                    }
                }
            }
        }

























