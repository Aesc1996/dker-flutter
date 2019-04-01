[![Build Status](https://travis-ci.org/dodopontocom/dker-flutter.svg?branch=develop)](https://travis-ci.org/dodopontocom/dker-flutter)  
# odroidfeeder

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## Getting Started in Docker

This repository will help you to run flutter completely without any installation on the host machine.  

### Checkout this repository as below  

``` 
~$ git clone https://github.com/dodopontocom/dker-flutter.git ; cd dker-flutter  
```

### Run script test as below  

``` 
~$ ./cloud/docker/build-test.sh <your_project_name>  
```

### Build an example as below  

```
~$ cd odroidfeeder; docker run -it --rm -v $PWD:/root/test -w /root/test flutter-android-sdk flutter build apk
```  

result app in `./build/app/outputs/apk/app.apk`  

### Flutter command aliased for you  

just run inside your app project folder as bellow

```
~$ cd <your_flutter_project_folder>
~$ alias flutter="docker run -it --rm -v $PWD:/root/test -w /root/test flutter-android-sdk flutter"
~$ flutter
```  


