// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import { Turbo } from "@hotwired/turbo-rails";

import * as ActionCable from '@rails/actioncable'

// Initialize ActionCable
window.ActionCable = ActionCable;

import "./controllers"
import "controllers"
