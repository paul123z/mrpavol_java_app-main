pipeline{
    agent any  
    stages{
        stage('Git Checkout'){
            steps{
                script{
                    git branch: 'master', url: 'https://github.com/paul123z/mrpavol_java_app-main.git'
                }
            }
        }
    }
}