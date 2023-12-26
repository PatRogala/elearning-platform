// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "preline/preline.js"
import "./controllers"
import "./utils/themeSwitcher"
import "./utils/heroCodeEditor"


// Add turbo:load event listener to reinitialize
// HSStaticMethods from Preline
document.addEventListener("turbo:load", () => {
  HSStaticMethods.autoInit();
})
