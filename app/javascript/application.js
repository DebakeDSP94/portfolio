// Entry point for the build script in your package.json
import './add_jquery';
import 'jquery-ui';
import '@hotwired/turbo-rails';
// import mrujs from 'mrujs';
// window.mrujs = mrujs;
// mrujs.start({
// 	maskLinkMethods: false,
// });

import * as Turbo from '@hotwired/turbo';
window.Turbo = Turbo;

import * as bootstrap from 'bootstrap';
window.bootstrap = bootstrap;

import 'vanilla-nested';

import './controllers';
console.log('application js here');

import * as ActiveStorage from '@rails/activestorage';
ActiveStorage.start();

import 'trix';
import '@rails/actiontext';
