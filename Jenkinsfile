pipeline{
    agent any
    stages{
        stage('start'){
            steps{
                echo 'initializing...'
            }
        }
        /* stage('fetch'){
            steps{
                 git branch: 'master', credentialsId: 'GitCred', url: 'https://github.com/dharmendrarana999/my-first-rep.git'
               //git url: 'https://github.com/dharmendrarana999/my-first-rep.git'
            }
        }*/
        stage('build'){
            steps{
               bat 'mvn clean install'
            }
        }
        stage('compile'){
            steps{
               bat 'mvn compile'
            }
        }
        stage('test'){
            steps{
               bat 'mvn test'
            }
        }
        stage('package'){
            steps{
               bat 'mvn package'
            }
        }
        stage('sonarCodeAnalysis'){
            steps {
                withSonarQubeEnv('SonarQube'){
                    
                   // bat 'sonar-scanner.bat -Dsonar.projectKey=MyGit -Dsonar.projectName=MyGIt -Dsonar.projectVersion=1.0'
                  bat 'mvn sonar:sonar'
                    
                }
            }
        }
        stage('Artifactory')
        {
	        steps
	        {
		        rtMavenDeployer (
    			    id: 'deployer',
		            serverId: 'Artifactory',
		            releaseRepo: 'example-repo-local',
		            snapshotRepo: 'example-repo-local' 
		        )
		        rtMavenRun (
		        pom: 'pom.xml',
		        goals: 'clean install',
		        deployerId: 'deployer'
			)
		        rtPublishBuildInfo (
		            serverId: 'Artifactory' 
		                )
	        }
	}
    }
}
