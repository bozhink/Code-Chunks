var gulp = require('gulp'),
    less = less = require('gulp-less'),
    cleanCSS = require('gulp-clean-css'),
    minify = require('gulp-minify'),
    browserify = require('gulp-browserify'),
    mocha = require('gulp-mocha');

gulp.task('less', function () {
    gulp.src('./public/src/stylesheet/**/*.less')
        .pipe(less())
        .pipe(cleanCSS({
            compatibility: 'ie8'
        }))
        .pipe(gulp.dest('./public/dist/css'))
        .on('error', function () {
            this.emit('end');
        });
});

gulp.task('validation-js', function () {
    gulp.src('./public/src/js/validation/**/*.js')
        .pipe(minify({
            ext: {
                src: '.js',
                min: '.js'
            },
            exclude: ['tasks'],
            ignoreFiles: ['-min.js']
        }))
        .pipe(gulp.dest('./public/dist/js/validation'))
        .on('error', function () {
            this.emit('end');
        });
});

gulp.task('browserify', function() {
  return gulp.src('./public/src/js/app.js').
    pipe(browserify()).
    pipe(gulp.dest('./public/dist/js/'));
});

gulp.task('build', ['less', 'validation-js', 'browserify']);

gulp.task('continuous-build', function () {
    gulp.watch(['./public/src/**/*.*'], ['build']);
});

gulp.task('test', function () {
    gulp.src('./public/tests/*.js')
        .pipe(mocha())
        .on('error', function () {
            this.emit('end');
        });
});

gulp.task('watch', function () {
    gulp.watch('./public/src/**/*.js', ['test']);
});