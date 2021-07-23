window.addEventListener('load', () => {
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = (Math.floor(inputValue * 0.1));
    const profitNumber = document.getElementById("profit")
    const price_result = inputValue * 0.1
    profitNumber.innerHTML = (Math.floor(inputValue - price_result));
  })
})