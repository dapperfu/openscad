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

  }
}