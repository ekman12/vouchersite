const goToUrlOnClick = () => {
  document.querySelectorAll('.clickable-card').forEach(div => {
    div.addEventListener('click', ()=>{
      window.location = `/${div.getAttribute('data-card')}s/${div.getAttribute('data-id')}`
    });
  })
}

export { goToUrlOnClick }
