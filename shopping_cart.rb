class ShoppingCart
  
  attr_accessor :pricing_rules,:content, :promo

  #Class method for pricing rules array
  def self.pricing_rules_hash
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
      if content[item['Product Code']].nil?
        content[item['Product Code']] = 1
      else
        content[item['Product Code']] += 1
      end
      puts "Promo: #{promo}"
      return content
    else
      puts "Promo: #{promo}"
      return "Invalid item"
    end
  end

  def total
    total = 0
    pricing_rules.each do |rule|
      unless (content[rule["Product Code"]].nil? || content[rule["Product Code"]] <= 0)
        case rule["Product Code"]
        when "ult_small"
          total +=  ( (content[rule["Product Code"]] / 3) * (2 * rule['Price']) ) + ( (content[rule["Product Code"]] % 3) * rule["Price"] )
        when "ult_large"
          if content[rule["Product Code"]] > 3
            total += content[rule["Product Code"]] * 39.90
          else
            total += content[rule["Product Code"]] * rule['Price']
          end
        else
          total += content[rule['Product Code']] * rule['Price']
        end
      end
    end
    total *= 0.9 if promo
    return "$#{'%.02f' % total}"
  end

  def items
    if content['ult_medium'].nil? || content['ult_medium'] <= 0
      return content
    else
      item_hash = content.clone
      if item_hash['1gb'].nil?
        item_hash['1gb'] = item_hash['ult_medium']
      else
        item_hash['1gb'] += item_hash['ult_medium']
      end
      return item_hash
    end
  end
end