@Library('my-shared-library') _

pipeline{
    agent any  

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: "Choose create/destroy")
    }


    stages{

        
        stage('Git Checkout'){
            when{expression{
            params.action == 'create' }}
       
            steps{
                gitCheckout(
                    branch: "master",
                    url: "https://github.com/paul123z/mrpavol_java_app-main.git"
                )
                }
            }


        stage('Unit Test Maven'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{
                    mvnTest()
                }
                }
            }



        stage('Integration Test Maven'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{
                    mvnIntegrationTest()
                }
                }
            }



        stage('Static code analysis: Sonarqube'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{

                    def sonarqubeCredentialsId = 'sonarqube-api'
                    statiCodeAnalysis(sonarqubeCredentialsId)
                }
                }
            }



        stage('Quality Gate Status Check: Sonarqube'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{

                    def sonarqubeCredentialsId = 'sonarqube-api'
                    QualityGateStatus(sonarqubeCredentialsId)
                }
                }
            }



                    stage('Maven Build: maven'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{

                    mvnBuild()
                }
                }
            }


            



        }
    }
