pipeline {
  agent any
  stages {
    stage('Git Clean') {
      steps {
        sh 'git clean -xfd'
      }
    }

    stage('Make') {
      steps {
        sh 'make'
      }
    }

    stage('Slice All') {
      steps {
        sh 'BUILD_DEST=${HOME}/.octoprint/uploads ./slice_all.sh'
      }
    }

  }
}