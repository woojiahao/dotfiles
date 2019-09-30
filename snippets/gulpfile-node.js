let gulp = require('gulp');
let ts = require('gulp-typescript');
let tsProject = ts.createProject('tsconfig.json');

gulp.task(
  'default',
  () => tsProject
    .src()
    .pipe(tsProject())
    .js
    .pipe(gulp.dest('dist'))
);
