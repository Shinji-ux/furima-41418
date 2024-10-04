function price(){

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  
  const addTaxPrice = Math.floor(inputValue * 0.1);
  const addTaxPriceArea = document.getElementById("add-tax-price");
  document.getElementById("add-tax-price").innerHTML = "";
  addTaxPriceArea.insertAdjacentHTML("afterbegin", addTaxPrice);

  const profit = Math.floor(inputValue * 0.9);
  const profitArea = document.getElementById("profit");
  document.getElementById("profit").innerHTML = "";
  profitArea.insertAdjacentHTML("afterbegin", profit);
});
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);