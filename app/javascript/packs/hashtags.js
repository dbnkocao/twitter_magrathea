// javascript/packs/custom.js
window.hashtag_mask =  function (element) {
  regex = /[A-Za-z0-9_]/g;
  old_str = element.value;
  result = old_str.match(regex);
  new_str = ''

  if(result != null){
    new_str = result.join('');  
  }

  element.value = new_str; 
}