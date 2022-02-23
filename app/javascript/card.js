const pay = () => {
  Payjp.setPublicKey("pk_test_ecf236c08d33bb5ba20afc9b");
  const submit = document.getElementById("button");
  console.log(submit)
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    console.log(formData)

    const card = {
      number: formData.get("order_address[card_number]"),
      cvc: formData.get("order_address[card_cvc]"),
      exp_month: formData.get("order_address[card_exp_month]"),
      exp_year: `20${formData.get("order_address[card_exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
      }
      console.log(card)
    });

  });
};

window.addEventListener("load", pay);