node {

	stage ('Checkout'){
		checkout scm
	}
	
	stage ('Build') {
		def mvnHome = tool 'M3'
		echo 'build'	
		// Run the maven build
		sh "${mvnHome}/bin/mvn clean install"		
	}
	stage ('Deploy'){
		echo 'deploy'
		sh "deploy.sh"
	}
	
}