pipeline {
  agent any

  environment {
    SF_CLI = '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd"'
  }

  stages {
    stage('Authorize Dev Hub') {
      steps {
        echo '🔐 Authorizing Dev Hub...'
        withCredentials([file(credentialsId: 'SFDX_AUTH_FILE', variable: 'SFDX_AUTH_FILE')]) {
          bat "${env.SF_CLI} org login sfdx-url --sfdx-url-file \"%SFDX_AUTH_FILE%\" --set-default-dev-hub"
        }
      }
    }

    stage('Pre-clean Scratch Org') {
      steps {
        echo '🧹 Cleaning up existing scratch org if any...'
        bat """
        ${env.SF_CLI} org delete scratch --target-org scratchOrg --no-prompt || exit /b 0
        """
      }
    }

    stage('Create Scratch Org') {
      steps {
        echo '🏗️ Creating new scratch org...'
        bat "${env.SF_CLI} org create scratch --definition-file config\\project-scratch-def.json --alias scratchOrg --duration-days 1 --set-default"
      }
    }

    stage('Deploy Metadata') {
      steps {
        echo '🚀 Deploying metadata to scratch org...'
        bat "${env.SF_CLI} project deploy start --target-org scratchOrg --ignore-conflicts"
      }
    }

    stage('Run Apex Tests') {
      steps {
        echo '🧪 Running Apex tests...'
        bat "${env.SF_CLI} apex run test --test-level RunLocalTests --output-dir test-results --result-format junit --target-org scratchOrg"
      }
    }
  }

  post {
    always {
      echo '🧹 Post-cleanup: Deleting scratch org...'
      bat """
      ${env.SF_CLI} org delete scratch --target-org scratchOrg --no-prompt || exit /b 0
      """

      echo '📄 Publishing test results...'
      junit 'test-results/*.xml'
    }
  }
}
