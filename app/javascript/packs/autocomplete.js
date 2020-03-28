const autocomplete = () => {
  console.log('is it here?')
    var post_address = document.getElementById('voucher_restaurant');
    console.log(post_address)
    if (post_address) {
      console.log(post_address)
      var autocomplete = new google.maps.places.Autocomplete(post_address, { types: [ 'establishment' ] });
      google.maps.event.addDomListener(post_address, 'keydown', function(e) {
        console.log(e)
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      }
      );
    }
}

export { autocomplete };
