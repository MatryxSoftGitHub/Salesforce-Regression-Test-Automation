pipeline {
  agent any

  environment {
    SFDX_AUTH_URL = credentials('SFDX_AUTH_URL')
    SF_CLI = '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd"' // Absolute path to sf CLI
  }

  stage('Authorize Dev Hub') {
  steps {
    bat '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd" org login sfdx-url --sfdx-url "%SFDX_AUTH_URL%" --set-default-dev-hub'
  }
}


    stage('Create Scratch Org') {
      steps {
        bat "${env.SF_CLI} org create scratch --definition-file config\\project-scratch-def.json --alias scratchOrg --duration-days 1 --set-default"
      }
    }

    stage('Deploy Metadata') {
      steps {
        bat "${env.SF_CLI} project deploy start --target-org scratchOrg --ignore-conflicts"
      }
    }

    stage('Run Apex Tests') {
      steps {
        bat "${env.SF_CLI} apex run test --target-org scratchOrg --output-dir test-results --result-format junit"
      }
    }

    stage('Delete Scratch Org') {
      steps {
        bat "${env.SF_CLI} org delete scratch --target-org scratchOrg --no-prompt"
      }
    }
  }

  post {
    always {
      junit 'test-results/test-result.xml'
    }
  }
}
