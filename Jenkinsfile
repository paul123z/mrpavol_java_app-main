@Library('my-shared-library') _

pipeline{
    agent any  
    stages{
        stage('Git Checkout'){
            steps{
                gitCheckout(
                    branch: "master",
                    url: "https://github.com/paul123z/mrpavol_java_app-main.git"
                )
                }
            }


        stage('Unit Test Maven'){
            steps{
                script{
                    mvnTest()
                }
                }
            }


        }
    }
