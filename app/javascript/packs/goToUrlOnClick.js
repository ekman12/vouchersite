const goToUrlOnClick = () => {
  let divs = document.querySelectorAll('.clickable-card')

  divs.forEach(div => {
    div.addEventListener('click', ()=>{
      // console.log(div.getAttribute('data-id'))
      // console.log(div.getAttribute('data-card'))
      window.location = `/${div.getAttribute('data-card')}s/${div.getAttribute('data-id')}`
    });
  })
}
export { goToUrlOnClick }
