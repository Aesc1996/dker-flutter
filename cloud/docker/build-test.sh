#!/bin/bash
#
#set -x

IMAGE=flutter-android-sdk
project_name=$1
travis_flag=$2
base_script=$(dirname $0)
project_root=$base_script/../..
create=''

#if project variable not populated
if [[ -z $project_name ]]; then
	echo "give the name of the project as parameter"
	exit 1
fi
#if project is new then create
if [[ ! -d $project_root/$project_name ]]; then
	echo "creating $project_root/$project_name"
	mkdir $project_root/$project_name
fi
#if projct is empty then tell docker to create
if [[ $(find $project_root/$project_name -name 'pubspec.yaml' | wc -l) == 1 ]]; then
	create=no
else
	create=yes
fi		

echo "create project: $create"
docker build --quiet -t $IMAGE .

cp -rv $project_root/$project_name/ $base_script/
if [[ $create == yes ]]; then
	docker run --rm -it -v $PWD/$project_name:/root/$project_name -w /root/ $IMAGE flutter create $project_name
fi

if [[ -z $travis_flag ]]; then
	echo "testing the app..."
	echo "on project: $project_name"
	echo "docker run --rm -it -v $PWD/$project_name:/root/$project_name -w /root/$project_name $IMAGE flutter test"
	docker run --rm -it -v $PWD/$project_name:/root/$project_name -w /root/$project_name $IMAGE flutter test
else
	echo "Building the app..."
	echo "on project: $project_name"
	echo "docker run --rm -it -v $PWD/$project_name:/root/$project_name -w /root/$project_name $IMAGE flutter build apk"
	docker run --rm -it -v $PWD/$project_name:/root/$project_name -w /root/$project_name $IMAGE flutter build apk
fi
