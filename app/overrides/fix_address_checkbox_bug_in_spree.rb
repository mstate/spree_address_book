# fixes logic of when to show checked which appears to be a bug in spree.
# also sends a value of 0 when unchecked

text_to_replace = %{
	              <span data-hook="use_billing">
	              	<input name="order[use_billing]" type="hidden" value="0" />
                  <%= check_box_tag 'order[use_billing]', '1', (@order.bill_address.empty? || @order.ship_address.empty? || @order.bill_address.id == @order.ship_address.id) %>
                  <%= label_tag 'order[use_billing]', Spree.t(:use_billing_address) %>
                </span>
} 


Deface::Override.new(
  :virtual_path => "spree/admin/orders/customer_details/_form",
  :name => "fix_checkbox_logic_on_admin_address",
  :replace => "[data-hook='use_billing']",
  :text => text_to_replace
)
