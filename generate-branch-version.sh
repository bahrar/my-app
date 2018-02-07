VERSION_FILE=$1
VERSION=`cat pom.xml | grep version | head -1 | cut -d "<" -f 2 | cut -d ">" -f 2`        
echo " VERSION avant : $VERSION"
# mettre à jour la version en la concaténant avec le nom de la branche
VERSION=${BRANCH_NAME}-${VERSION}
# remplacer / par _
slash="/"
VERSION="${VERSION//$slash/}"
echo "----- Mise à jour de la version par $VERSION------"
mvn versions:set -DnewVersion=$VERSION

# récupérer la version du pom après modification
VERSION=`cat pom.xml | grep version | head -1 | cut -d "<" -f 2 | cut -d ">" -f 2`        
echo " VERSION après : $VERSION"
echo $VERSION > $VERSION_FILE