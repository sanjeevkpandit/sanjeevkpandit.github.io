---
title: Getting started with gulp
date: '2016-06-11T00:00:00Z'
draft: false
slug: 'getting-started-with-gulp'
categories: ['Tech', 'Development']
tags: ['gulp', 'nodejs']
description: 'Learn basics of gulp.'
---

<a href="http://gulpjs.com/" target="_blank">Gulp</a> is an automated tool that helps to enhance workflow.

### Why gulp?

- Simple
- Automation of tasks
- Platform independent
- Plugins available in large number

### Getting started

#### Installation Instructions

- <a href="http://npmjs.com/" target="_blank">Npm</a> needs to be installed in order to install <a href="http://gulpjs.com/" target="_blank">gulp</a>. Please find the installation instructions <a href="{{site.baseurl}}/install-node-and-npm/" target="_blank">here</a>.

- Remove gulp (if installed before)

```bash
$ npm rm --global gulp
```

- Install gulp

```
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

```bash
gulp
```

- For a specific task

```js
gulp.task('test', function() {
  console.log('This is a test task');
});
```

```bash
# gulp <task_name>
gulp test
```

#### Sample `gulpfile.js`.

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

Download above gulpfile from <a href="https://gist.github.com/sanjeevkpandit/38e690d8c1625ee1486fa13e3d554700" target="_blank">here</a>.

#### Resources

- <a href="http://gulpjs.com/" target="_blank">http://gulpjs.com/</a>
- <a href="https://github.com/sanjeevkpandit/gulp-step-by-step" target="_blank">https://github.com/sanjeevkpandit/gulp-step-by-step</a>
