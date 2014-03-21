module.exports = function(grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        jshint: {
            options: {
                globals: {
                    Toolkit: true,
                    jQuery: true,
                    console: true
                },
                browser: true,
                jquery: true,
                // enforcing
                curly: true,
                eqeqeq: true,
                immed: true,
                latedef: true,
                noempty: true,
                quotmark: 'single',
                undef: true,
                unused: 'vars',
                strict: true,
                trailing: true,
                // relaxing
                boss: true,
                scripturl: true
            },
            files: ['web/jss/*.js']
        },

        uglify: {
            options: {
                report: 'min'
            },
            build: {
                files: {
                    'web/js/script.min.js': ['web/jss/common.js'],
                    'web/js/home.min.js': ['web/jss/home.js'],
                    'web/js/docs.min.js': ['web/jss/docs.js']
                }
            }
        },

        watch: {
            scripts: {
                files: 'web/jss/**/*.js',
                tasks: ['uglify']
            }
        }
    });

    // Load plugins
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-watch');

    // Register tasks
    grunt.registerTask('default', ['jshint', 'uglify']);
};