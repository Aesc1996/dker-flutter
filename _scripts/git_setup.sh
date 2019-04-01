#!/bin/bash

email=$1
name=$2

git config --global user.email "${email}"
git config --global user.name "${name}"
git config --global credential.helper cache
