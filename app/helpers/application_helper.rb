module ApplicationHelper
  def show_cart_or_error
    if enhanced_cart.length < 1
      render 'empty'
    else 
      render 'cart'
    end
  end
end
