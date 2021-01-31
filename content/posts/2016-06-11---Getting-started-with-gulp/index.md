+++
date = '2016-06-11'
title = 'Getting started with gulp'
slug = 'getting-started-with-gulp'
tags = ['gulp', 'nodejs']
categories = ['Tech', 'Development']
description = 'Learn basics of gulp'
+++

[Gulp](http://gulpjs.com/) is an automated tool that helps to enhance workflow.

### Why gulp?

- Simple
- Automation of tasks
- Platform independent
- Plugins available in large number

### Getting started

#### Installation Instructions

- [NPM](http://npmjs.com/) needs to be installed in order to install [gulp](http://gulpjs.com/). Please find the installation instructions [here](/posts/install-node-and-npm/).

- Remove gulp (if installed before)

  ```sh
  npm rm --global gulp
  ```

- Install gulp

  ```sh
  # Globally
  npm install --global gulp-cli

  # Within a project
  npm install gulp --save-dev
  ```

#### Implementation in a project

- Create a file `gulpfile.js` in project's root folder and add following contents in it.

  ```js
  var gulp = require('gulp');

  gulp.task('default', function() {
    // default task
  });
  ```

- Run gulp. This will run the default task as defined above.

  ```sh
  gulp
  ```

- For a specific task

  ```js
  gulp.task('test', function() {
    console.log('This is a test task');
  });
  ```

  ```sh
  # gulp <task_name>
  gulp test
  ```

#### Sample `gulpfile.js`

```js
var gulp = require('gulp');
var sass = require('gulp-sass');
var babel = require('gulp-babel');
var notify = require('gulp-notify');
var minify = require('gulp-minify');
var concat = require('gulp-concat');

var SCSS_FILES = 'src/sass/**/*.scss';
var JS_FILES = 'src/js/**/*.js';
var ES6_FILES = 'src/js/es6/**/*.js';

// Handle any error that appears during execution of gulp tasks
var errorHandler = function(error) {
  notify.onError({
    title: 'Task Failed [' + error.plugin + ']',
    message: 'Oops! Something went north!',
    sound: true
  })(error);

  // Prevent gulp watch from stopping
  this.emit('end');
};

// Convert the sass files to css
gulp.task('sass', function() {
  return gulp
    .src(SCSS_FILES)
    .pipe(sass())
    .on('error', errorHandler)
    .pipe(gulp.dest('public/css/'))
    .pipe(
      notify({
        message: 'SCSS completed'
      })
    );
});

// Concat the css files to a single file
gulp.task('concat-css', function() {
  return gulp
    .src(SCSS_FILES)
    .pipe(sass())
    .pipe(concat('compiled.scss'))
    .pipe(gulp.dest('public/css/'));
});

// Concat the js files to a single file
gulp.task('concat-js', function() {
  return gulp
    .src(JS_FILES)
    .pipe(concat('compiled.js'))
    .pipe(gulp.dest('public/js/'));
});

// Transpile ES6 into JavaScript(ES5)
gulp.task('es6', function() {
  return gulp
    .src(ES6_FILES)
    .pipe(babel())
    .on('error', errorHandler)
    .pipe(gulp.dest('public/js/'))
    .pipe(
      notify({
        message: 'ES6 Compiled'
      })
    );
});

// Minify js files
gulp.task('minify-js', function() {
  return gulp
    .src(JS_FILES)
    .pipe(concat('compiled.js'))
    .pipe(minify())
    .pipe(gulp.dest('public/js/'));
});

// Default task
gulp.task('default', ['sass', 'es6']);

// Watch files for any change
gulp.task('watch', function() {
  gulp.watch(SCSS_FILES, ['sass']);
  gulp.watch(ES6_FILES, ['es6']);
});
```

Download above gulp file from [here](https://gist.github.com/sanjeevkpandit/38e690d8c1625ee1486fa13e3d554700).

#### Resources

- [http://gulpjs.com/](http://gulpjs.com/)
- [https://github.com/sanjeevkpandit/gulp-step-by-step](https://github.com/sanjeevkpandit/gulp-step-by-step)
