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
        "C:\\Program Files (x86)\\sf\\bin\\sf.cmd" org delete scratch --target-org scratchOrg --no-prompt
        IF %ERRORLEVEL% NEQ 0 (
          echo No existing scratch org to delete.
          exit /b 0
        )
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
  }

  post {
    always {
      // ✅ Always try deleting the scratch org
      bat '''
      echo Cleaning up scratch org...
      "C:\\Program Files (x86)\\sf\\bin\\sf.cmd" org delete scratch --target-org scratchOrg --no-prompt
      IF %ERRORLEVEL% NEQ 0 (
        echo Scratch org already deleted or not found.
        exit /b 0
      )
      '''

      // ✅ Publish test results
      junit 'test-results/*.xml'
    }
  }
}
