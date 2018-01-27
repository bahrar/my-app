node {
   def VERSION="1.0.1"
	stage ('Checkout'){
		checkout scm
	}
	
	stage ('Build') {
		def mvnHome = tool 'M3'
		echo 'build $VERSION'	
		// Run the maven build
		echo 'sh ${mvnHome}/bin/mvn clean install'
		bat "${mvnHome}/bin/mvn clean install"		
	}
	stage ('Deploy'){
		echo 'deploy $VERSION'
		bat "deploy.sh"
	}
	
}
