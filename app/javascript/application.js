// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "preline/preline.js"
import "./controllers"
import "./utils/themeSwitcher"

// Add turbo:load event listener to reinitialize
// HSStaticMethods from Preline
document.addEventListener("turbo:load", () => {
  HSStaticMethods.autoInit();
})
