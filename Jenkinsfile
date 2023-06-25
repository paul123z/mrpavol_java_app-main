@Library('my-shared-library') _

pipeline{
    agent any  

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: "Choose create/destroy")
    }


    stages{

        when{expression{
            param.action == 'create'
        }}
        stage('Git Checkout'){
            steps{
                gitCheckout(
                    branch: "master",
                    url: "https://github.com/paul123z/mrpavol_java_app-main.git"
                )
                }
            }


        stage('Unit Test Maven'){
            when{expression{
            param.action == 'create'
        }}
            steps{
                script{
                    mvnTest()
                }
                }
            }



        stage('Integration Test Maven'){
            when{expression{
            param.action == 'create'
        }}
            steps{
                script{
                    mvnIntegrationTest()
                }
                }
            }





        }
    }
