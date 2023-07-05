@Library('my-shared-library') _

pipeline{
    agent any  

    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: "Choose create/destroy")
        string(name: 'ImageName', description: "name of the docker build", defaultValue: "javaapp")
        string(name: 'ImageTag', description: "tag of the docker build", defaultValue: "v1")
        string(name: 'DockerHubUser', description: "name of the Application", defaultValue: "pavol12")
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


        // stage('Unit Test Maven'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{
        //             mvnTest()
        //         }
        //         }
        //     }





        // stage('Unit Test Maven'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{
        //             mvnTest()
        //         }
        //         }
        //     }


        stage('Build an image: JKUBE'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{
                    sh """
                    mvn package oc:build
                    """
                }
                }
            }

        stage('Deploy an image: JKUBE'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{
                    sh """
                    mvn oc:resource oc:deploy
                    """
                }
                }
            }

        // stage('Integration Test Maven'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{
        //             mvnIntegrationTest()
        //         }
        //         }
        //     }



        // stage('Static code analysis: Sonarqube'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{

        //             def sonarqubeCredentialsId = 'sonarqube-api'
        //             statiCodeAnalysis(sonarqubeCredentialsId)
        //         }
        //         }
        //     }



        // stage('Quality Gate Status Check: Sonarqube'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{

        //             def sonarqubeCredentialsId = 'sonarqube-api'
        //             QualityGateStatus(sonarqubeCredentialsId)
        //         }
        //         }
        //     }



        //             stage('Maven Build: maven'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{

        //             mvnBuild()
        //         }
        //         }
        //     }




        //             stage('Docker Image Build'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{

        //             dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
        //         }
        //         }
        //     }



        //             stage('Docker Image Scan: trivy'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{

        //             dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
        //         }
        //         }
        //     }



        //             stage('Docker Image Push: DockerHub'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{

        //             dockerImagePush("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
        //         }
        //         }
        //     }

            


        //             stage('Docker Image Cleanup: DockerHub'){
        //     when{expression{
        //     params.action == 'create'
        // }}
        //     steps{
        //         script{

        //             dockerImageCleanup("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
        //         }
        //         }
        //     }



                    stage('Uploading Jar artifact: Nexus'){
            when{expression{
            params.action == 'create'
        }}
            steps{
                script{

                    def readPomVersion = readMavenPom file: 'pom.xml'

                    nexusArtifactUploader artifacts: 
                    
                    [[
                        artifactId: 'kubernetes-configmap-reload', 
                    classifier: '', 
                    file: 'target/kubernetes-configmap-reload-0.0.1-SNAPSHOT.jar', 
                    type: 'jar']], 

                    credentialsId: 'nexus-admin', 
                    groupId: 'com.minikube.sample', 
                    nexusUrl: '18.192.80.50:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'demoapp-release-pavol', 
                    version: "${readPomVersion.version}"
                }
                }
            }






        }
    }
