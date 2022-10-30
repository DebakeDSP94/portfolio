// Entry point for the build script in your package.json
import './add_jquery';
import 'jquery-ui';
import '@hotwired/turbo-rails';
import mrujs from 'mrujs';
window.mrujs = mrujs;
import * as Turbo from '@hotwired/turbo';
window.Turbo = Turbo;
mrujs.start();

import * as bootstrap from 'bootstrap';
window.bootstrap = bootstrap;

import 'vanilla-nested';

import './controllers';

console.log('application js here');

import 'trix';
import '@rails/actiontext';
