pipeline {
  
agent any

  tools {
    // Here we have pairs of tool symbols (not all tools have symbols, so if you
    // try to use one from a plugin you've got installed and get an error and the 
    // tool isn't listed in the possible values, open a JIRA against that tool!)
    // and installations configured in your Jenkins master's tools configuration.
    ////// jdk "jdk8"
	maven "M3"
  }
  
  environment {
    // Environment variable identifiers need to be both valid bash variable
    // identifiers and valid Groovy variable identifiers. If you use an invalid
    // identifier, you'll get an error at validation time.
    // Right now, you can't do more complicated Groovy expressions or nesting of
    // other env vars in environment variable values, but that will be possible
    // when https://issues.jenkins-ci.org/browse/JENKINS-41748 is merged and
    // released.
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
			// Run the maven build
			echo "sh mvn clean install"
			sh "mvn clean install"
		}
	}
	stage ('Deploy'){
		steps {
		echo "sh deploy.sh ${VERSION}"		
		sh "sh deploy.sh ${VERSION}"
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

