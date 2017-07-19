require_relative 'shopping_cart'

pricingRules = ShoppingCart.default_pricing_rules
cart = ShoppingCart.new(pricingRules)
cart.add('ult_small')
cart.add('ult_medium')
cart.add('ult_medium')
cart.items
cart.total
