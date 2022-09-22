// Entry point for the build script in your package.json
import './add_jquery';
import '@hotwired/turbo-rails';
import './controllers';
import consumer from './channels/consumer';
import CableReady from 'cable_ready';
import mrujs from 'mrujs';
import { CableCar } from 'mrujs/plugins';

import * as bootstrap from 'bootstrap';
window.bootstrap = bootstrap;

import './custom/portfolios';
import './custom/html.sortable';

mrujs.start({
	plugins: [new CableCar(CableReady)],
});
