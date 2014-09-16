require_relative '../../spec_helper'

require_relative '../../../lib/prawn/receipt'

describe Prawn::Receipt do
  before do
    @receipt = Prawn::Receipt.new :customer_email => "no@one.com",
                           :customer_name => "noone",
                           :amount_billed => "100.00",
                           :credit_card => "123-1234-3456",
                           :transaction_id => "123"
  end

  it "accept hash options" do
    proc {
      Prawn::Receipt.new
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
