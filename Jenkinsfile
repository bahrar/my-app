pipeline {
  
agent any

  parameters {
		string (
			name: "PLAY",
			defaultValue:  "main.yml",
			description: "playbook a exÃ©cuter"
		)
		choice(name: 'ENV', choices: 'STAGE\nPROD', description: 'env oÃ¹ dÃ©ployer')
  }
  
  tools {
    // jdk "jdk8"
	maven "M3"
  }
  
  environment {
    ENV = "PIC"
	VERSION_FILE = "version.txt"
    CREDS = credentials('deploy')
  }
 
stages{  
	stage ('Checkout'){
		steps {
		
		checkout scm
		
		sh '''
        echo "CREDS $CREDS"
        echo "CREDS_USR $CREDS_USR"
        echo "CREDS_PSW $CREDS_PSW" 
		sh generate-branch-version.sh version.txt
        '''
        script {
          // get groovy variable VERSION
          VERSION = readFile('version.txt').trim()
        }		
        
        //sh "sh deploy.sh"
		}
	}
	
	stage ('Build') {
		steps {
			echo "building ${VERSION} ${ENV}"	
			// Run the maven build and upload artifacts to nexus repository
			echo "sh mvn clean install"
			// sh "mvn clean install"
		}
	}
	stage ('Deploy'){
		steps {
		echo "sh deploy.sh ${VERSION}"		
		// sh "sh deploy.sh ${CREDS_USR}"
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

