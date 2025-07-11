pipeline {
  agent any

  environment {
    SFDX_AUTH_URL = credentials('SFDX_AUTH_URL')
  }

  stages {
    stage('Authorize Dev Hub') {
      steps {
        sh 'sf org login sfdx-url --sfdx-url-file $SFDX_AUTH_URL --set-default-dev-hub'
      }
    }

    stage('Create Scratch Org') {
      steps {
        sh 'sf org create scratch --definition-file config/project-scratch-def.json --alias scratchOrg --duration-days 1 --set-default'
      }
    }

    stage('Deploy Metadata') {
      steps {
        sh 'sf project deploy start --target-org scratchOrg --ignore-conflicts'
      }
    }

    stage('Run Apex Tests') {
      steps {
        sh 'sf apex run test --target-org scratchOrg --output-dir test-results --result-format junit'
      }
    }

    stage('Delete Scratch Org') {
      steps {
        sh 'sf org delete scratch --target-org scratchOrg --no-prompt'
      }
    }
  }

  post {
    always {
      junit 'test-results/test-result.xml'
    }
  }
}
