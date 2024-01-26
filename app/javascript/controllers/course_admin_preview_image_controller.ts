import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="course-admin-preview-image"
export default class extends Controller {
  static targets = [ "imageInput", "imagePreview" ]
  imageInputTarget: HTMLInputElement
  imagePreviewTarget: HTMLImageElement

  connect() {
    // console.log('CourseAdminPreviewImageController#connect');
  }

  updatePreview() {
    console.log('CourseAdminPreviewImageController#updatePreview');
    if (this.imageInputTarget.files && this.imageInputTarget.files[0]) {
      var reader = new FileReader();

      // We create a new image instead of changing the src of the existing one
      // because default image is made using div instead of img
      reader.onload = (e) => {
        this.imagePreviewTarget.src = e.target.result as string;
        this.imagePreviewTarget.classList.remove('hidden');
      }

      reader.readAsDataURL(this.imageInputTarget.files[0]);
    }
  }
}
