class ShoppingCart
  
  attr_accessor :pricing_rules,:content, :promo

  #Class method for pricing rules array
  def self.default_pricing_rules
    pricing_rules = [
      {"Product Code" => 'ult_small', "Product Name" =>  'Unlimited 1GB', "Price" =>24.90},
      {"Product Code" => 'ult_medium', "Product Name" =>  'Unlimited 2GB', "Price" =>29.90},
      {"Product Code" => 'ult_large', "Product Name" =>  'Unlimited 5GB', "Price" =>44.90},
      {"Product Code" => '1gb', "Product Name" => '1 GB Data-pack', "Price" => 9.90},
    ]
  end

  #Initializer
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @content = Hash.new
    @promo = false
  end

  #Start of methods
  def add(*args)
    raise ArgumentError, "Too many arguments" if args.length > 2
    item, promo_code = *args    
    item = pricing_rules.select{|product| item == product['Product Code'] || item == product['Product Name']}.first
    
    self.promo = true if promo_code == 'I<3AMAYSIM'
    
    unless item.nil?
      if content[item['Product Name']].nil?
        content[item['Product Name']] = 1
      else
        content[item['Product Name']] += 1
      end
      puts "Item Added #{item['Product Name']}"
      puts "Promo Active? #{promo}"
    else
      puts "Invalid Product Code/Name"
      puts "Promo Active? #{promo}"
    end
  end

  def total
    total = 0
    pricing_rules.each do |rule|
      unless (content[rule["Product Name"]].nil? || content[rule["Product Name"]] <= 0)
        case rule["Product Name"]
        when "Unlimited 1GB"
          total +=  ( (content[rule["Product Name"]] / 3) * (2 * rule['Price']) ) + ( (content[rule["Product Name"]] % 3) * rule["Price"] )
        when "Unlimited 5GB"
          if content[rule["Product Name"]] > 3
            total += content[rule["Product Name"]] * 39.90
          else
            total += content[rule["Product Name"]] * rule['Price']
          end
        else
          total += content[rule['Product Name']] * rule['Price']
        end
      end
    end
    total *= 0.9 if promo
    puts "Total Price: $#{'%.02f' % total}"
  end

  def items
    if content['Unlimited 2GB'].nil? || content['Unlimited 2GB'] <= 0
      puts "Cart Contents:"
      content.each do |product_name,quantity|
        puts "#{product_name} x #{quantity}"
      end
      return content
    else
      item_hash = content.clone
      puts "Cart Contents:"
      if item_hash['1 GB Data-pack'].nil?
        item_hash['1 GB Data-pack'] = item_hash['Unlimited 2GB']
      else
        item_hash['1 GB Data-pack'] += item_hash['Unlimited 2GB']
      end
      item_hash.each do |product_name,quantity|
        puts "#{product_name} x #{quantity}"
      end
      return item_hash
    end
  end
end