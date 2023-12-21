document.addEventListener('turbo:load', () => {
  const previewImgDiv = document.getElementById('avatar_prev') as HTMLImageElement;
  const input = document.getElementById('profile_avatar_input') as HTMLInputElement;

  if (input && previewImgDiv) {
    input.addEventListener('change', () => {
      readURL(input, previewImgDiv);
    });
  }
});

const readURL = (input: HTMLInputElement, previewImgDiv: HTMLDivElement) => {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      const previewImg = document.createElement('img') as HTMLImageElement;
      previewImg.src = e.target.result as string;
      previewImg.classList.add('w-[70px]');
      previewImg.classList.add('h-[70px]');
      previewImg.classList.add('rounded-full');
      previewImgDiv.innerHTML = '';
      previewImgDiv.appendChild(previewImg);
    }

    reader.readAsDataURL(input.files[0]);
  }
}
