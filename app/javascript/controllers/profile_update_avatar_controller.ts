import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-update-avatar"
export default class extends Controller {
  static targets = [ "avatarInput", "avatarPreview" ]
  avatarInputTarget: HTMLInputElement
  avatarPreviewTarget: HTMLDivElement

  connect() {
  }

  updateAvatar() {
    if (this.avatarInputTarget.files && this.avatarInputTarget.files[0]) {
      var reader = new FileReader();

      // We create a new image instead of changing the src of the existing one
      // because default image is made using div instead of img
      reader.onload = (e) => {
        const previewImg = document.createElement('img') as HTMLImageElement;
        previewImg.src = e.target.result as string;
        previewImg.classList.add('w-[70px]');
        previewImg.classList.add('h-[70px]');
        previewImg.classList.add('rounded-full');
        this.avatarPreviewTarget.innerHTML = '';
        this.avatarPreviewTarget.appendChild(previewImg);
      }

      reader.readAsDataURL(this.avatarInputTarget.files[0]);
    }
  }
}
