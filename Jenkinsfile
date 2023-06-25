pipeline{
    agent any
    
    stages('Git Checkout'){
        steps{
            script{
                git branch: 'main', url: 'https://github.com/vikash-kumar01/mrdevops_java_app.git'
            }
        }
    }
}