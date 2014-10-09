function buy(id, btn){
  $(btn).button('loading');

  $.ajax({
    type: 'POST',
    url: '/invoices',
    data: { product_id: id },
    dataType: 'script'
  });
}