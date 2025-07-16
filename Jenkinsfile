pipeline {
  agent any

  environment {
    SF_CLI = '"C:\Program Files\sf\bin\sf.cmd"' // Update if your path is different
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
          bat """
            echo Authorizing Dev Hub...
            %SF_CLI% org login sfdx-url --sfdx-url-file "%SFDX_AUTH_FILE%" --set-default-dev-hub
          """
        }
      }
    }

    stage('Create Scratch Org') {
      steps {
        echo '🏗️ Creating new scratch org...'
        bat """
          %SF_CLI% org create scratch --definition-file config\\project-scratch-def.json --alias %SF_ENV_ALIAS% --duration-days 1 --set-default
        """
      }
    }

    stage('Deploy Metadata') {
      steps {
        echo '🚀 Deploying metadata to scratch org...'
        bat """
          %SF_CLI% project deploy start --target-org %SF_ENV_ALIAS% --ignore-conflicts
        """
      }
    }

    stage('Run Apex Tests') {
      steps {
        echo '🧪 Running Apex tests and saving JUnit results...'
        bat """
          mkdir test-results
          %SF_CLI% apex run test --test-level RunLocalTests --output-dir test-results --result-format junit --target-org %SF_ENV_ALIAS%
        """
      }
    }
  }

  post {
    always {
      echo '📄 Publishing Apex test results...'
      junit 'test-results/test-result-*.xml'

      echo '🧹 Deleting scratch org...'
      bat """
        %SF_CLI% org delete scratch --target-org %SF_ENV_ALIAS% --no-prompt || exit 0
      """
    }
  }
}
