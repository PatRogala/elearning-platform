import { Controller } from "@hotwired/stimulus"
import ace from "ace-builds/src-min/ace"
import "ace-builds/src-min/mode-ruby"
import "ace-builds/src-min/theme-chrome"
import "ace-builds/src-min/theme-tomorrow_night_bright"
import "ace-builds/src-min/keybinding-vscode"

// Connects to data-controller="hero-code-editor"
export default class extends Controller {
  static targets = ["editorDiv"]
  editorDivTarget: HTMLDivElement

  connect() {
    this.initHeroCodeEditor()
    this.setupThemeObserver()
  }

  initHeroCodeEditor() {
    const editor = ace.edit("code-hero");
    editor.setOptions({
      mode: "ace/mode/ruby",
      selectionStyle: "text",
      keyboardHandler: "ace/keyboard/vscode",
      fontSize: "14px",
      tabSize: 2,
      showPrintMargin: false,
    });

    if (document.documentElement.classList.contains('dark')) {
      editor.setTheme("ace/theme/tomorrow_night_bright");
    } else {
      editor.setTheme("ace/theme/chrome");
    }

    editor.setValue(`RSpec.describe "Users" do
  subject(:user) { create(:user) }

  describe "unauthenticated user" do
    describe "GET /profile" do
      it "returns http redirect" do
        get profile_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "GET /profile/edit" do
      it "returns http redirect" do
        get edit_profile_path
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "PUT /profile" do
      it "returns http redirect" do
        put profile_path, params: { user: { fullname: "New Name" } }
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "GET /users/sign_up" do
      it "returns http success" do
        get new_user_registration_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
    `)

    // Don't select the text
    editor.clearSelection();
  }

  setupThemeObserver() {
    // Create a new MutationObserver instance for theme changes
    const observer = new MutationObserver((mutationsList) => {
      // Look through all mutations that just occured
      for(let mutation of mutationsList) {
        // If the class attribute was modified
        if (mutation.attributeName === 'class') {
          this.initHeroCodeEditor();
        }
      }
    });

    // Start observing the target node for configured mutations
    observer.observe(document.documentElement, { attributes: true });
  }
}
