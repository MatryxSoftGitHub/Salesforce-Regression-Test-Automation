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
        // Correct order: test-level BEFORE target-org
        bat '"C:\\Program Files (x86)\\sf\\bin\\sf.cmd" apex run test --test-level RunLocalTests --target-org scratchOrg --output-dir test-results --result-format junit'
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
      // Correct JUnit pattern: It must match generated filename, e.g., ApexTestResult.xml
      junit 'test-results/*.xml'
    }
  }
}
