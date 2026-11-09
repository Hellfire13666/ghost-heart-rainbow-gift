(() => {
  'use strict';
  const art=[{"slug": "social-blue", "title": "Rainbow Love • Blue Signal", "alt": "A luminous violet gift, little ghost, terminal, and blue roses", "file": "assets/art/social-blue.jpg", "thumb": "assets/thumbs/social-blue.jpg"}, {"slug": "social-green", "title": "Neon Bloom • Green Signal", "alt": "Electric green-and-purple gift for family, friends, and bros", "file": "assets/art/social-green.jpg", "thumb": "assets/thumbs/social-green.jpg"}, {"slug": "present-one", "title": "The Original Present", "alt": "Purple neon gift with blue roses and a ghost", "file": "assets/art/present-one.jpg", "thumb": "assets/thumbs/present-one.jpg"}, {"slug": "present-two", "title": "A Gift of Friendship", "alt": "GlitchByte neon gift artwork and brotherhood message", "file": "assets/art/present-two.jpg", "thumb": "assets/thumbs/present-two.jpg"}, {"slug": "present-three", "title": "Neon Hearts", "alt": "Neon gift box with glitchy hearts and bright green accents", "file": "assets/art/present-three.jpg", "thumb": "assets/thumbs/present-three.jpg"}, {"slug": "present-four", "title": "Madd Love Always", "alt": "A glowing little present and affectionate welcome message", "file": "assets/art/present-four.jpg", "thumb": "assets/thumbs/present-four.jpg"}];
  const dialog=document.getElementById('lightbox');
  const image=document.getElementById('viewerImage');
  const title=document.getElementById('viewerTitle');
  const indexLabel=document.getElementById('viewerIndex');
  const save=document.getElementById('viewerSave');
  let selected=0;
  function show(i){
    selected=(i+art.length)%art.length;
    const item=art[selected]; image.src=item.file;image.alt=item.alt;
    title.textContent=item.title;indexLabel.textContent=(selected+1)+' of '+art.length;
    save.href=item.file;save.download='GLITCHBYTE-GHOST-HEART-'+item.slug+'.jpg';
  }
  document.querySelectorAll('[data-art]').forEach(el => {
    el.addEventListener('click',event=>{event.preventDefault();
      show(art.findIndex(item=>item.slug===el.dataset.art));
      if(!dialog.open)dialog.showModal();
    });
  });
  document.getElementById('viewerClose').addEventListener('click',()=>dialog.close());
  document.getElementById('viewerPrev').addEventListener('click',()=>show(selected-1));
  document.getElementById('viewerNext').addEventListener('click',()=>show(selected+1));
  dialog.addEventListener('click',e=>{if(e.target===dialog)dialog.close();});
  document.addEventListener('keydown',e=>{
    if(!dialog.open)return;
    if(e.key==='ArrowLeft'){e.preventDefault();show(selected-1);}
    if(e.key==='ArrowRight'){e.preventDefault();show(selected+1);}
  });
  const slug=location.hash.slice(1);
  const at=art.findIndex(item=>item.slug===slug);
  if(at>=0){show(at);dialog.showModal();}
})();