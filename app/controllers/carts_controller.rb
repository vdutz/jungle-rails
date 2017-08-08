class CartsController < ApplicationController

  def show
  end

  def add_item
    product_id = params[:product_id].to_s

    product = Product.find_by(id: product_id)
    # if product.quantity =
    # flash[:error] = "Your book was not found"

    item = cart[product_id] || { "quantity" => 0 }

    if product.quantity == item["quantity"]
      flash[:notice] = "Not enough quantity in stock to increase order quantity for that product"
      redirect_to :back
    else
      item["quantity"] += 1
      cart[product_id] = item
      update_cart cart

      redirect_to :back
    end
  end

  def remove_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1
    update_cart cart

    redirect_to :back
  end

end
