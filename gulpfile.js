'use strict';

var gulp = require('gulp'),
    plumber = require('gulp-plumber'),
    rename = require('gulp-rename'),
    // CSS
    sass = require('gulp-ruby-sass'),
    prefixer = require('gulp-autoprefixer'),
    // JS
    uglify = require('gulp-uglify'),
    jshint = require('gulp-jshint'),
    // Images
    imagemin = require('gulp-imagemin');

gulp.task('css', function() {
    return sass('./src/css/', {
            style: 'compressed',
            compass: true,
            unixNewlines: true
        })
        .pipe(prefixer({
            browsers: ['last 3 versions'],
            cascade: false
        }))
        .pipe(rename(function(file) {
            file.basename += '.min';
        }))
        .pipe(gulp.dest('./web/css/'))
});

gulp.task('js', function() {
    return gulp.src('./src/js/**/*.js')
        .pipe(plumber())
        .pipe(jshint())
        .pipe(jshint.reporter('default'))
        .pipe(uglify())
        .pipe(rename(function(file) {
            file.basename += '.min';
        }))
        .pipe(gulp.dest('./web/js/'))
});

gulp.task('img', function() {
    return gulp.src('./src/img/**/*.{gif,jpg,jpeg,png,svg}')
        .pipe(plumber())
        .pipe(imagemin({
            optimizationLevel: 4,
            progressive: true
        }))
        .pipe(gulp.dest('./web/img/'))
});

gulp.task('default', ['css', 'js', 'img']);

gulp.task('watch', ['default'], function() {
    gulp.watch('./src/js/**/*.js', ['js']);
    gulp.watch('./src/css/**/*.scss', ['css']);
    gulp.watch('./src/img/**/*.{gif,jpg,jpeg,png,svg}', ['img']);
});
