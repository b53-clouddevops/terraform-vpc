// @Library('roboshop-shared-library@main') _
// env.REPONAME="terraform-vpc"
// terraform()

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

            stage('Did you review the plan?') {
                input {
                    message 'Did you review'
                    parameters {
                        booleanParam(name: 'Apply?', defaultValue: false, description: 'True to proceed further')
                    }
                }
                steps { sh "Proceeding To Apple" }
            }

            stage('Terraform Apply ') {
                steps {
                    sh "terraform ${ACTION} -var-file=env-${ENV}/${ENV}.tfvars -auto-approve"
                    }
                }
            }
        }

























