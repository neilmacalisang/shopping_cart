require_relative 'shopping_cart'

pricingRules = ShoppingCart.default_pricing_rules
cart = ShoppingCart.new(pricingRules)
cart.add('ult_small')
cart.add('1gb','I<3AMAYSIM')
cart.items
cart.total
