// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from 'rails-ujs'
Rails.start()
import "bootstrap"
import "flatpickr"
import "@popperjs/core"


// //stripe javascript code for enable payment method on sign_up
// // Include the Stripe.js script
// var stripe = Stripe('pk_test_51QpWtpCKHyDovAIVPmzcIh8oTq4SRZaffv2AB4hQUkNPiSmKdXkQ0De1JKHYXoHdsyv83ikB5SfQspJcx6ccLUYq00DVU9nMrp'); // Your Stripe publishable key
// var elements = stripe.elements();
// var card = elements.create('card');
// card.mount('#card-element');

// var form = document.querySelector('form');
// form.addEventListener('submit', function(event) {
//   event.preventDefault();

//   stripe.createToken(card).then(function(result) {
//     if (result.error) {
//       // Inform the user if there was an error
//       var errorElement = document.getElementById('card-errors');
//       errorElement.textContent = result.error.message;
//     } else {
//       // Send the token to your server
//       var tokenInput = document.createElement('input');
//       tokenInput.type = 'hidden';
//       tokenInput.name = 'stripeToken';
//       tokenInput.value = result.token.id;
//       form.appendChild(tokenInput);

//       // Submit the form
//       form.submit();
//     }
//   });
// });

