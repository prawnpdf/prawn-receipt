require_relative '../../spec_helper'

require_relative '../../../lib/prawn/receipt'

include Prawn::Receipt
describe Receipt do
  before do
    @receipt = Receipt.new :customer_email => "no@one.com",
                           :customer_name => "noone",
                           :amount_billed => "100.00",
                           :credit_card => "123-1234-3456",
                           :transaction_id => "123"
  end

  it "accept hash options" do
    proc {
      Receipt.new
    }.must_raise ArgumentError
  end

  it "store template var to state" do
    @receipt.state.must_equal :customer_email => "no@one.com",
                              :customer_name => "noone",
                              :amount_billed => "100.00",
                              :credit_card => "123-1234-3456",
                              :transaction_id => "123"
  end

  it "render pdf file" do
    @receipt.render_file "receipt_file.pdf"
  end

end
