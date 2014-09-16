require "bundler"

Bundler.require

require_relative '../lib/prawn/receipt'

receipt = Prawn::Receipt.new :customer_email => "nope@one.com",
                             :customer_name  => "noone",
                             :amount_billed  => "100.00",
                             :credit_card    => "123-1234-3456",
                             :transaction_id => "123"

receipt.render_file "receipt_file.pdf"
