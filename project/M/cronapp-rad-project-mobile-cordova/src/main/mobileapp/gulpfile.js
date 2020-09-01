const gulp = require('gulp');

gulp.sass = require('gulp-sass');
gulp.cleanCss = require('gulp-clean-css');
gulp.rename = require('gulp-rename');

var paths = {
  sass: ['./scss/**/*.scss']
};

function defaultTask(cb) {
  // place code for your default task here
  cb();
}

function clean(cb) {
  cb();
}

function build(cb) {
  sass(cb);
}

function sass(cb) {
  gulp.src(paths.sass)
      .pipe(gulp.sass())
      .on('error', gulp.sass.logError)
      .pipe(gulp.dest('./www/css/'))
      .pipe(gulp.cleanCss({
        keepSpecialComments: 0
      }))
      .pipe(gulp.rename({ extname: '.min.css' }))
      .pipe(gulp.dest('./www/css/'))
      .on('end', cb);
}

exports.build = gulp.series(clean, build);
exports.clean = clean;
exports.sass = sass;
exports.default = defaultTask;