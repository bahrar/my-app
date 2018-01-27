node {
	stage 'Checkout'
		checkout scm

	stage 'Build'
		echo 'build'
		# sh "\"${tool 'MSBuild'}\" SolutionName.sln /p:Configuration=Release /p:Platform=\"Any CPU\" /p:ProductVersion=1.0.0.${env.BUILD_NUMBER}"

	stage 'Deploy'
		echo 'deploy'

}