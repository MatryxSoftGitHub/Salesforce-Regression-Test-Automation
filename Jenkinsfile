pipeline {
  agent any

  stages {
    stage('Authorize Dev Hub') {
      steps {
        withCredentials([file(credentialsId: 'SFDX_AUTH_FILE', variable: 'SFDX_AUTH_FILE')]) {
          bat '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd" org login sfdx-url --sfdx-url-file "%SFDX_AUTH_FILE%" --set-default-dev-hub'
        }
      }
    }

    stage('Pre-clean Scratch Org') {
      steps {
        bat '''
        echo Deleting existing scratch org if present...
        "C:\\Program Files (x86)\\sf\\bin\\sf.cmd" org delete scratch --target-org scratchOrg --no-prompt || echo "No existing scratch org to delete"
        '''
      }
    }

    stage('Create Scratch Org') {
      steps {
        bat '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd" org create scratch --definition-file config\\project-scratch-def.json --alias scratchOrg --duration-days 1 --set-default'
      }
    }

    stage('Deploy Metadata') {
      steps {
        bat '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd" project deploy start --target-org scratchOrg --ignore-conflicts'
      }
    }

    stage('Run Apex Tests') {
  steps {
    bat '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd" apex run test --test-level RunLocalTests --output-dir test-results --result-format junit --target-org scratchOrg'
  }
}

    stage('Delete Scratch Org') {
      steps {
        bat '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd" org delete scratch --target-org scratchOrg --no-prompt'
      }
    }
  }

  post {
    always {
      junit 'test-results/*.xml'
    }
  }
}
