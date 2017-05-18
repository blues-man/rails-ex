#!/bin/bash
oc new-project jenkins
oc new-app https://raw.githubusercontent.com/openshift/origin/master/examples/jenkins/jenkins-ephemeral-template.json
oc new-project development --display-name="Development" --description="Development project"
oc new-app https://raw.githubusercontent.com/blues-man/rails-ex/master/openshift/templates/rails-postgresql-dev.json
oc new-project testing --display-name="Testing" --description="Testing project"
oc new-app https://raw.githubusercontent.com/blues-man/rails-ex/master/openshift/templates/rails-postgres-test.json
oc project jenkins
oc create -f https://raw.githubusercontent.com/blues-man/rails-ex/master/openshift/pipeline/development-pipeline.yaml
oc create -f https://raw.githubusercontent.com/blues-man/rails-ex/master/openshift/pipeline/testing-pipeline.yaml
oc policy add-role-to-user edit system:serviceaccount:jenkins:jenkins -n development
oc policy add-role-to-user edit system:serviceaccount:jenkins:jenkins -n testing

