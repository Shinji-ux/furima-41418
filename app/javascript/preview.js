function preview () {
  const itemImage = document.getElementById('item-image');
  const previewList = document.getElementById('preview');
  if (!itemImage) return null;

  const fileUpload = document.getElementById("item-image");
  fileUpload.addEventListener('change', function(e){
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);

    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');

    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });

};


window.addEventListener('turbo:load', preview);