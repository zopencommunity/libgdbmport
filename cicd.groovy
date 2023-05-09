node('linux')
{
  stage('Build') {
    build job: 'Port-Pipeline', parameters: [string(name: 'PORT_GITHUB_REPO', value: 'https://github.com/ZOSOpenTools/libgdbmport.git'), string(name: 'PORT_DESCRIPTION', value: 'GNU dbm is a set of database routines that use extendible hashing and works similar to the standard UNIX dbm routines.' )]
  }
}
