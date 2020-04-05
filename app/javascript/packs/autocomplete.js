const autocomplete = () => {
  console.log('is it here?')
    var post_address = document.getElementById('voucher_restaurant');
    var options = {
      types: ['establishment'],
      componentRestrictions: {country: "uk"}
    };
    if (post_address) {
      var autocomplete = new google.maps.places.Autocomplete(post_address, options);
      google.maps.event.addDomListener(post_address, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      }
      );
    }
}

export { autocomplete };
