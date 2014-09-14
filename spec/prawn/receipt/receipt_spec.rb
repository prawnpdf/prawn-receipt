require_relative '../../spec_helper'

require_relative '../../../lib/prawn/receipt'

include Prawn::Receipt
describe Receipt do
  before do
    @receipt = Receipt.new :customer_email => "no@one.com",
                           :amount_billed => "100",
                           :transaction_id => "123"
  end

  it "accept hash options" do
    proc {
      Receipt.new
    }.must_raise ArgumentError
  end

  it "store template var to state" do
    @receipt.state.must_equal :customer_email => "no@one.com",
                              :amount_billed => "100",
                              :transaction_id => "123"
  end

  it "render pdf file" do
    @receipt.render_file "receipt_file.pdf"
  end

end
