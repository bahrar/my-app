node {
   def VERSION = "1.0.1"
   deleteDir()
	stage ('Checkout'){
        checkout scm
	}
	
	stage ('Build') {
		def mvnHome = tool 'M3'
		echo "building ${VERSION}"	
		// Run the maven build
		echo "sh ${mvnHome}/bin/mvn clean install"
		bat "${mvnHome}/bin/mvn clean install"		
	}
	stage ('Deploy'){
		echo "deploying ${VERSION}"	
		echo "ls -l"
		sh "ls -l"		
		sh "${WORKSPACE}/deploy.sh"
	}
	
}
