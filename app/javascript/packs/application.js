console.log('Hello World from Webpacker')

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels").start()

import "controllers"
import "bootstrap"
import "../stylesheets/application"

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
