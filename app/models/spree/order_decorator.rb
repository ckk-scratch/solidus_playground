Spree::Order.class_eval do
#replace :delivery to any other state 
  remove_checkout_step :delivery  


  def ensure_available_shipping_rates

    return  true

  end
end 