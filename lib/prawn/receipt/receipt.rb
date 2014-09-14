require 'prawn'
require 'prawn/table'
module Prawn
  module Receipt
    # Your code goes here...
    class Receipt
      include Prawn::View
      attr_accessor :state
      def initialize(options)
        @state = Hash[options.dup]
        build_receipt
      end

      def build_receipt
        image "#{Prawn::Receipt::RECEIPTDATADIR}/pr-logo.png", :position => :center
        font_size(25) { text "Receipt for your payment to Practicing Ruby", :align => :center }

        build_table

        font_size(20) {text "Your account is all paid up, thank you!", :align=> :center}

        bounding_box([0,30], :width => 72*7.5, :height => 30) do

          text "Your payment for your Practicing Ruby subscription has been successfully processed.", :align=> :center
          text "Please keep this receipt for your records. If you have questions, email <color rgb='0000ff'><u>gregory@practicingruby.com</u><color>", :inline_format => true, :align=> :center

        end
      end

      def build_table
        move_down 10
        data = [
                ["Payment date", state.fetch(:payment_date) {Time.now.strftime "%B %e, %Y "}],
                ["Account billed", "$#{state.fetch(:amount_billed)} USD"],
                ["Account charged", "#{state.fetch(:customer_name)}(#{state.fetch(:customer_email)})"],
                ["Charged to", state.fetch(:credit_card)],
                ["Transaction ID", state.fetch(:transaction_id)]
               ]
        table data, :row_colors => ["F0F0F0", "FFFFCC"], :width => bounds.width
        move_down 10
      end
    end

  end
end
