Rails.configuration.stripe = {

publishable_key: ENV["pk_test_51QpWtpCKHyDovAIVPmzcIh8oTq4SRZaffv2AB4hQUkNPiSmKdXkQ0De1JKHYXoHdsyv83ikB5SfQspJcx6ccLUYq00DVU9nMrp"],

secret_key: ENV["sk_test_51QpWtpCKHyDovAIV4VUAPn5nSjZBKSzZhJZDGDK94hGYCnpkUrkuNOqHA64Io9O5l51TOARU91MteYMtEiY2d5vX00x7zv3fOe"]

}
Stripe.api_key = Rails.configuration.stripe[:secret_key]
