#/bin/sh
VERSION=$1
if [ "$VERSION" == "deploy_user" ] ;then
echo "oui deploy_user"
else
echo "non deploy_user"
fi
echo "deploying Version $VERSION..."
echo "deploying Version $VERSION..." > toto.txt 
