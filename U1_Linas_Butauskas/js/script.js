function validateForm() {
    if( document.getElementById('fieldOne').value === '' || document.getElementById('fieldTwo').value === ''){
      alert('Būtina užpildyti visus laukius');
    } else {
    alert('Sėkmingai užsiprenumeruota!');
    }
}