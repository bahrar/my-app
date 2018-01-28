pipeline {
  
agent any

  parameters {
		string (
			name: "PLAY",
			defaultValue:  "main.yml",
			description: "playbook à exécuter"
		)
		choice(name: 'ENV', choices: 'STAGE\nPROD', description: 'env où déployer')
  }
  
  tools {
    // jdk "jdk8"
	maven "M3"
  }
  
  environment {
    ENV = "PIC"
	VERSION = "1.0.1"
  }
 
stages{  
	stage ('Checkout'){
		steps {
        checkout scm
        sh "sh deploy.sh"
		}
	}
	
	stage ('Build') {
		steps {
			echo "building ${VERSION} ${ENV}"	
			// Run the maven build and upload artifacts to nexus repository
			echo "sh mvn clean deploy"
			sh "mvn clean deploy"
		}
	}
	stage ('Deploy'){
		steps {
		echo "sh deploy.sh ${VERSION}"		
		sh "sh deploy.sh ${VERSION}"
		}
	}
	stage ('Acceptance-Test'){
		steps {
		echo "sh Acceptance-Test for ${VERSION}"		
		}
	}	
	stage ('cleanup'){	
	  steps {
		  // Let's wipe out the workspace before we finish!
		  deleteDir()
		}
	  }	
 }
}

