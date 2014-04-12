module.exports = (grunt) ->
  
  grunt.initConfig

    coffee:
      api: 
        files:
          'bin/index.js': 'src/api/index.coffee'
  
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default', ['coffee']