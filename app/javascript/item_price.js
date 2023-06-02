window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const calculatedValue = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = calculatedValue;

    const profitElement = document.getElementById("profit");
    const profit = inputValue - calculatedValue;
    profitElement.innerHTML = profit;


  })
})
