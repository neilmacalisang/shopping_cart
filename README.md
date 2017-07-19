# Shopping Cart

### To use scripts:

 * Make sure you have `ruby` installed, check https://www.ruby-lang.org/en/documentation/installation/ for more details
 * Download or clone the repository
 * Extract the repository and change directory to the extracted folder
 * Run the ruby script scenario commands.

### Sample:
```
ruby shopping_cart_scenario_4.rb
Item Added Unlimited 1GB
Promo Active? false
Item Added 1 GB Data-pack
Promo Active? true
Cart Contents:
Unlimited 1GB x 1
1 GB Data-pack x 1
Total Price: $31.32
```

### For Interactive Ruby Shell:

  * in IRB type "require_relative 'shopping_cart'"
  * Define the pricing rules array. It is an array of hashes with the keys (1) Product Code, (2) Product Name and (3) Price
  ```
  pricing_rules = [
      {"Product Code" => 'ult_small', "Product Name" =>  'Unlimited 1GB', "Price" =>24.90},
      {"Product Code" => 'ult_medium', "Product Name" =>  'Unlimited 2GB', "Price" =>29.90},
      {"Product Code" => 'ult_large', "Product Name" =>  'Unlimited 5GB', "Price" =>44.90},
      {"Product Code" => '1gb', "Product Name" => '1 GB Data-pack', "Price" => 9.90},
    ]
  ```
  * A default pricing rules array could be invoked by using the Shopping Cart method "default_pricing_rules". (ex. pricingRules = ShoppingCart.default_pricing_rules)
  * An instance of the shopping cart should be initialized with a pricing rules array. (ex. cart = ShoppingCart.new(pricingRules))
  * After initializing a ShoppingCart you may use the following commands:
    1. Use ShoppingCart.add(item) to add items. You could add items by using either their Product Code or Product Name.
    2. Use ShoppingCart.add(item,promo_code) to add an item and use the promo code. Promo Code is 'I<3AMAYSIM'
    3. Use ShoppingCart.items to show the expected items in the cart.
    4. Use ShoppingCart.total to show the expected cost.

### Promos

  * A 3 for 2 deal on Unlimited 1GB Sims. So for example, if you buy 3 Unlimited 1GB Sims, you will pay the price of 2 only for the first month.
  * The Unlimited 5GB Sim will have a bulk discount applied; whereby the price will drop to $39.90 each for the first month, if the customer buys more than 3.
  * We will bundle in a free 1 GB Data-pack free-of-charge with every Unlimited 2GB sold.
  * Adding the promo code 'I<3AMAYSIM' will apply a 10% discount across the board.

### Default Pricing Rules
Product Code  | Product Name  | Price
------------- | ------------- | -------
ult_small     | Unlimited 1GB | $24.90
ult_medium    | Unlimited 2GB | $29.90
ult_large     | Unlimited 5GB | $44.90
1gb           | 1 GB Data-pack| $9.90
