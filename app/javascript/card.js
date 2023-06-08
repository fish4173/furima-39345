const pay = () => {
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY)// PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form"); //card-exp-year
  cvcElement.mount("#cvc-form");




  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => { //clickが正解

    const inputCardnumber = document.getElementById("number-form").value;
    const cardExpiry = document.getElementById("expiry-form").value;
    const cvcNumber = document.getElementById("cvc-form").value;



    e.preventDefault();
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit();

    });
  });
};

window.addEventListener("load", pay);
