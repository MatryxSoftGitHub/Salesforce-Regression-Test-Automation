pipeline {
  agent any

  environment {
    SF_CLI = 'sf'  // Assumes sf is in the system PATH
    SF_ENV_ALIAS = 'scratchOrg'
  }

  stages {
    stage('Checkout SCM') {
      steps {
        echo '📥 Checking out code from GitHub...'
        checkout scm
      }
    }

    stage('Authorize Dev Hub') {
      steps {
        echo '🔐 Authorizing Dev Hub...'
        withCredentials([file(credentialsId: 'SFDX_AUTH_FILE', variable: 'SFDX_AUTH_FILE')]) {
          sh '''
            echo "Authorizing with Dev Hub..."
            $SF_CLI org login sfdx-url --sfdx-url-file "$SFDX_AUTH_FILE" --set-default-dev-hub
          '''
        }
      }
    }

    stage('Create Scratch Org') {
      steps {
        echo '🏗️ Creating new scratch org...'
        sh '''
          $SF_CLI org create scratch --definition-file config/project-scratch-def.json --alias $SF_ENV_ALIAS --duration-days 1 --set-default
        '''
      }
    }

    stage('Deploy Metadata') {
      steps {
        echo '🚀 Deploying metadata to scratch org...'
        sh '''
          $SF_CLI project deploy start --target-org $SF_ENV_ALIAS --ignore-conflicts
        '''
      }
    }

    stage('Run Apex Tests') {
      steps {
        echo '🧪 Running Apex tests and saving JUnit results...'
        sh '''
          mkdir -p test-results
          $SF_CLI apex run test --test-level RunLocalTests --output-dir test-results --result-format junit --target-org $SF_ENV_ALIAS
        '''
      }
    }
  }

  post {
    always {
      echo '🧹 Deleting scratch org...'
      sh '''
        $SF_CLI org delete scratch --target-org $SF_ENV_ALIAS --no-prompt || true
      '''

      echo '📄 Publishing Apex test results...'
      junit 'test-results/test-result-*.xml'
    }
  }
}
