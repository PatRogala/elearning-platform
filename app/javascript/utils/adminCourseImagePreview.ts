document.addEventListener('turbo:frame-load', () => {
  const previewImg = document.getElementById('img_prev') as HTMLImageElement;
  const input = document.getElementById('course_admin_preview_input') as HTMLInputElement;

  if (input && previewImg) {
    input.addEventListener('change', () => {
      readURL(input, previewImg);
    });
  }
});

const readURL = (input: HTMLInputElement, previewImg: HTMLImageElement) => {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      previewImg.src = e.target.result as string;
      previewImg.classList.add('w-full', 'object-cover');
      previewImg.classList.remove('hidden');
    }

    reader.readAsDataURL(input.files[0]);
  }
}