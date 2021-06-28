pipeline {
    agent any
	environment {
		registry = 'springboot-ecr:v_$BUILD_NUMBER'
		registryUrl='https://653308993752.dkr.ecr.us-west-1.amazonaws.com'
		registryCredentials = 'ecr:us-west-1:docker_credentials'
		dockerImage = ''
	}
    stages {
        stage('CleanWorkspace') {
            steps {
                cleanWs()
            }
        }
        stage ('SCM') {
            steps {
                checkout([$class: 'GitSCM', 
                	branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, 
                	extensions: [], 
                	submoduleCfg: [], 
                	userRemoteConfigs: [[url: 'https://github.com/Naresh240/ecs-deployment-with-jenkins.git']]])
            }
        }
        stage ('Build Artifact') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage ('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build registry
                }
            }
        }
        stage ('Docker Push') {
            steps {
                script {
                    docker.withRegistry(registryUrl,registryCredentials) {
                        dockerImage.push()
                    }
                }
            }
        }
                stage ('ecs-deploy') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'docker_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                        docker.withRegistry(registryUrl,registryCredentials) {
                            sh """
                                export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                                export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                                export AWS_DEFAULT_REGION=us-west-1
                                chmod +x deploy.sh
                                ./deploy.sh"""
                        }
                    }
                }
            }
        }
    }
}
