node {
   def VERSION = "1.0.1"
   deleteDir()
	stage ('Checkout'){
        checkout scm
        sh "sh deploy.sh"
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
		sh "sh deploy.sh"
	}
	
}
