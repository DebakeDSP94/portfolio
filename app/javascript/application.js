// Entry point for the build script in your package.json
import './add_jquery';
import 'jquery-ui';
import { createPopper } from '@popperjs/core';
import '@hotwired/turbo-rails';
import './controllers';
import consumer from './channels/consumer';
import CableReady from 'cable_ready';
import mrujs from 'mrujs';
import { CableCar } from 'mrujs/plugins';
import * as Turbo from '@hotwired/turbo';
window.Turbo = Turbo;
import 'vanilla-nested';
import * as bootstrap from 'bootstrap';
window.bootstrap = bootstrap;

mrujs.start({
	plugins: [new CableCar(CableReady)],
});
console.log('application js here');
import 'trix';
import '@rails/actiontext';
import "trix"
import "@rails/actiontext"
