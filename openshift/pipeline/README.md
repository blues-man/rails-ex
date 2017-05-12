This directory contains a Jenkinsfile which can be used to build rails-ex-ex using an OpenShift build pipeline.

To do this, run:

# create the rails-ex example as usual
oc new-app https://github.com/openshift/rails-ex-ex

# now create the pipeline build controller from the openshift/pipeline
# subdirectory
oc new-app https://github.com/openshift/rails-ex-ex \
  --context-dir=openshift/pipeline --name rails-ex-ex-pipeline
