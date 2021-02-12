node ('master'){

    // Get Artifactory Server Instance Details

  def server = Artifactory.server "01"

  def buildInfo = Artifactory.newBuildInfo()

  

notify ('Started')



try {



    stage('Git-Checkout'){

        git 'https://github.com/subbs28/201.git'

    }



    stage('Download Package') {

        def downloadSpec = """{ 

            "files": [

                {

                    "pattern": "jboss-war/*.war",

                    "target": "ansible-code/jboss/files/"

                }

            ]

        }"""

        server.download spec: downloadSpec

    }



    stage('Getting Ready For Ansible Deployment'){

        sh "echo \'<h1>JENKINS TASK BUILD ID: ${env.BUILD_DISPLAY_NAME}</h1>\' > ansible-code/roles/petclinic/files/jenkins.html"

    }





    stage('Java-webapp Ansible Deployment-Prod') {

        sh '/usr/bin/terraform init'

        sh '/usr/bin/terraform apply -input=false --auto-approve'

    }

notify('Completed')

 }

 catch(err){

  notify("Error ${err}")

  currentBuild.result = 'FAILURE'

 }

    

}



def notify(status){

    emailext( 

      to: "sjrocks28@gmail.com",

      subject: "${status}: JOB '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",

      body: """<p>${status}: JOB '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>

               <p> Check the Console output at <a href='${env.BUILD_URL}'>${env.JOB_NAME}[${env.BUILD_NUMBER}]</a></p>""",

    )

}
