pipeline {
    agent any 
    parameters { choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Chose the environment') }
    stages {
        stage('Terraform Init') {
            steps {
                sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
            }
        }
        stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars"
            }
        }
        stage('Terraform Apply ') {
            steps {
                sh "terraform apply -var-file=env-${ENV}/${ENV}.tfvars -auto-approve"
            }
        }
    }
}