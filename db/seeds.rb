# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)


# Loads seed data out of default dir
puts "Create payment method"
ii = PaymentMethod::Check.create :name => "test", :active => true, :environment => "development"

puts "Create shipping method"

s = ShippingMethod.new :name => "Shipping", :zone => Zone.find_by_name("North America")
s.calculator = Calculator::FlatRate.new :calculable => s.id, :calculable_type => "ShippingMethod"
s.save

puts "Create Users"

@admin = User.create :email => "spree@example.com", :password => "password", :password_confirmation => "password", :first_name => "Spree", :last_name => "Cat", :description => "Sup."
@admin.roles = [Role.first]
@admin.save
@user = User.create :email => "christopher@scratch.com", :password => "password", :password_confirmation => "password"
@user2 = User.create :email => "brad@scratch.com", :password => "password", :password_confirmation => "password"
@user3 = User.create :email => "justin@scratch.com", :password => "password", :password_confirmation => "password"
@user3 = User.create :email => "nicole@scratch.com", :password => "password", :password_confirmation => "password"

puts "Create Taxons"

# t = Taxonomy.create :name => "Producers"
# s = Taxonomy.create :name => "Products"

# supplier = t.taxons.create :name => "Suppliers", :parent_id => t.id
# toys = t.taxons.create :name => "Toys", :parent_id => t.id
# candy = t.taxons.create :name => "Candy", :parent_id => s.id
# t.taxons.create :name => "Clothing", :parent_id => s.id
# t.taxons.create :name => "Recipes", :parent_id => t.id

# s.taxons.create :name => "Potent Potables", :parent_id => t.id
# s.taxons.create :name => "Childrens", :parent_id => s.id
# s.taxons.create :name => "Baked Goods", :parent_id => s.id

a = Spree::Product.create :name => "Beginner DJing (DJ 101)", :price => "375", :shipping_category_id => 1, :available_on => 3.days.ago
a.save





puts "Finished Seed Data"