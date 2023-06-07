// const pay = () => {
//   const payjp = Payjp('pk_test_2f85c9b03837935a7f01b346')// PAY.JPテスト公開鍵
//   const elements = payjp.elements();
//   const numberElement = elements.create('cardNumber');
//   const expiryElement = elements.create('cardExpiry');
//   const cvcElement = elements.create('cardCvc');

//   numberElement.mount('#number-form');
//   expiryElement.mount('#expiry-form');
//   cvcElement.mount('#cvc-form');

//   const submit = document.getElementById("button");
//   submit.addEventListener("click", (e) => {
//     e.preventDefault();
//     console.log("フォーム送信時にイベント発火")
//   });
// };

// window.addEventListener("load", pay);
