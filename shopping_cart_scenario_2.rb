require_relative 'shopping_cart'

pricingRules = ShoppingCart.default_pricing_rules
cart = ShoppingCart.new(pricingRules)
cart.add('ult_small')
cart.add('ult_small')
cart.add('ult_large')
cart.add('ult_large')
cart.add('ult_large')
cart.add('ult_large')
cart.items
cart.total
