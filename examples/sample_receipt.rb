require_relative '../lib/prawn/receipt'

include Prawn::Receipt

receipt = Receipt.new :customer_email => "no@one.com",
                      :customer_name => "noone",
                      :amount_billed => "100.00",
                      :credit_card => "123-1234-3456",
                      :transaction_id => "123"

receipt.render_file "receipt_file.pdf"
