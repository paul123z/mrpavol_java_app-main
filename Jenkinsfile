pipeline{
    agent any  
    stages{
        stage('Git Checkout'){
            steps{
                script{
                    git branch: 'master', url: 'https://github.com/vikash-kumar01/mrdevops_java_app.git'
                }
            }
        }
    }
}