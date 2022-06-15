pipeline{
    parameters {
	    string(name: 'cluster_name', description: "Name of the EKS Cluster")
	    string(name: 'region', description: "Name of the AWS Region")
    }
    environment {
        account = "${environment}" 
        eks_cluster_name = "${cluster_name}" 
        artifacts_dir = "${env.WORKSPACE}/artifacts"
        aws_region = "${region}"
        job_root_dir="${env.WORKSPACE}"
    }
    agent any
    stages{
        stage('Initialize workspace') {
            steps {
            // Make sure the directory is clean
                dir("${artifacts_dir}") {
                    deleteDir()
                }
                sh(script: "mkdir -p ${artifacts_dir}", label: 'Create artifacts directory')
            }
        }
        stage('SCM'){
            steps{
                git branch: 'master',
                    url: 'https://github.com/Naresh240/jenkins-eks-cluster-integration.git'
            }
        }
        stage('Build'){
            steps{
               sh 'mvn clean package'
            }
        }
        stage("Generate_Kubeconfig_file"){
            steps {
                script {
                    env.KUBECONFIG = "${artifacts_dir}/${eks_cluster_name}-kubeconfig"
                    sh 'chmod +x ${WORKSPACE}/generate_kubeconfig_eks.sh'
                }
                sh(script: '${WORKSPACE}/generate_kubeconfig_eks.sh', label: 'Generate kubeconfig file')
            }
        }
        stage('Deploy_To_Cluster'){
            steps{
                script{
                    sh '''
                        kubectl apply -f deployment.yml
                        kubectl apply -f service.yml
                        kubectl get all
                    '''
                }
            }
        }
    }
    post {
	   cleanup {
	       cleanWs(cleanWhenFailure: false)
	   }
    }
}
