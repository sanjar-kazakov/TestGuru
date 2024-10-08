// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../utilities/sorting"
import "../utilities/pass_confirmation"
import "../utilities/form_inline"
import "../utilities/progress_bar"
import "../utilities/test_timer"

// Import jQuery and assign it to the global window object
import $ from 'jquery';
window.$ = window.jQuery = $;

// Import Bootstrap and Popper.js
import 'bootstrap';
import 'popper.js';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// Your custom JavaScript files
