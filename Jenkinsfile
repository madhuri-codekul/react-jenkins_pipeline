pipeline {
    environment {
    imageName = "jenkins_pipeline_demo"
    }

    agent any
    stages {
        stage('Building...'){
            steps{
                sh 'npm install'
                sh "npm run build"
            }
        }
           
            stage('Building Docker Image') {
                steps {
                    script {
                        sh 'docker build -t  $imageName:dev .'
                    }
                }
            }
            stage('deploy on master'){
                steps {
                    sh 'docker stop  $imageName:dev || true && docker rm  $imageName:dev || true'
                   //  sh 'docker run -it --rm -p 3000:3000 $imageName:dev'
                     sh 'docker run -itd -p  3000:3000 $imageName:dev'
                }
            }
           
    // stage('deploy on master'){  
    //         steps {
    //                sh 'docker run -itd -p  3000:3000 $imageName:dev'
    //         }
    //     }
            // stage('Cleaning Up') {
            //     steps{
            //       sh "docker rmi --force $registry:$BUILD_NUMBER"
            //     }
            // }
        }
    }