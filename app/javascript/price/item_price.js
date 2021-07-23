window.addEventListener('load', () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    console.log(addTaxDom);
    const profitNumber = document.getElementById("profit")
    const price_result = inputValue * 0.1
    console.log(price_result)
    profitNumber.innerHTML = (Math.floor(inputValue - price_result));
      console.log(profitNumber);
  })
})