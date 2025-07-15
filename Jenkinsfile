pipeline {
  agent any
  stages {
    stage('Check OS') {
      steps {
        script {
          println "OS: ${System.getProperty('os.name')}"
        }
      }
    }
  }
}
