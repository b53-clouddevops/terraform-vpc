// pipeline {
//     agent any 
//     parameters { 
//         choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Chose the environment') 
//         choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'Chose Apply or Destroy') 
//        }
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
//         stage('Terraform Apply ') {
//             steps {
//                 sh "terraform ${ACTION} -var-file=env-${ENV}/${ENV}.tfvars -auto-approve"
//             }
//         }
//     }
// }

// pipeline {
//     agent any
    
//     stages {
//         stage('Terraform Plan') {
//             steps {
//                 // Run Terraform plan command
//                 sh 'terraform plan -detailed-exitcode'
//                 script {
//                     // Capture the exit code
//                     def exitCode = sh(returnStatus: true, script: 'echo \$?').trim()
                    
//                     // Check the exit code and trigger next stage accordingly
//                     if (exitCode == '2') {
//                         echo 'Terraform plan found drift'
//                         // Trigger the next stage to send email
//                         build job: 'send-email', parameters: [
//                             string(name: 'subject', value: 'Terraform Drift Detected'),
//                             string(name: 'body', value: 'Terraform plan identified drift. Please take appropriate actions.'),
//                         ]
//                     } else {
//                         echo 'Terraform plan did not find any drift'
//                     }
//                 }
//             }
//         }
//         stage('Send Email') {
//             steps {
//                 // Add steps to send email using appropriate plugin or script
//                 echo 'Sending email...'
//                 // Example: Using Jenkins Mailer Plugin
//                 emailext subject: "${params.subject}", body: "${params.body}", to: 'you@example.com', attachLog: true
//             }
//         }
//     }
// }


// pipeline {
//     agent any

//     stages {
//         stage('Terraform Plan') {
//             steps {
//                 // Run Terraform plan command and capture exit code
//                 script {
//                     def result = sh(returnStdout: true, script: 'terraform plan --detailed-exitcode')
//                     def exitCode = result.returnCode
//                     env.TERRAFORM_EXIT_CODE = exitCode
//                 }
//             }
//         }
//         stage('Send Email') {
//             steps {
//                 // Use the captured exit code from the environment variable
//                 script {
//                     def terraformExitCode = env.TERRAFORM_EXIT_CODE
//                     if (terraformExitCode == 2) {
//                         echo 'Terraform plan found drift'
//                         // Trigger the email sending step here
//                     } else {
//                         echo 'Terraform plan did not find any drift'
//                     }
//                 }
//             }
//         }
//     }
// }


pipeline {
    agent any

    stages {
        stage('Terraform Plan') {
            steps {
                script {
                    // Execute Terraform init
                    sh 'terraform init'

                    // Execute Terraform plan and capture output
                    def planOutput = sh(script: 'terraform plan -input=false -no-color   -out=tfplan', returnStdout: true).trim()

                    // Check for drift information in the Terraform plan output
                    if (planOutput.contains('Drift detected')) {
                        echo 'Terraform plan has drift!'
                        // You can perform further actions here, such as sending notifications or failing the build
                    } else {
                        echo 'Terraform plan does not have drift.'
                        // Proceed to next stage or perform other actions
                    }
                }
            }
        }
    }
}





























