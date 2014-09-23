require 'prawn'
require 'prawn/table'

require_relative "receipt/version"

module Prawn
  class Receipt
    RECEIPTDATADIR = File.expand_path '../../data', File.dirname(__FILE__)

    include Prawn::View

    attr_accessor :state

    def initialize(options)
      @state = Hash[options.dup]
      build_receipt
    end

    def build_receipt
      image state.fetch(:logo_image_path),
        :position => :center, :width => 225
      #image "#{Prawn::Receipt::RECEIPTDATADIR}/pr-logo.png",
      #  :position => :center, :width => 225

      move_down 60

      font_size(20) do
        text "Receipt for your payment to #{state.fetch(:company_name)}", :align => :center
      end

      build_table

      font_size(16) do
        text "Your account is all paid up, thank you!", :align=> :center
      end

      bounding_box([0,30], :width => 72*7.5, :height => 30) do

        text "Your payment for your #{state.fetch(:company_name)} subscription has been successfully processed.", :align=> :center
        text "Please keep this receipt for your records. If you have questions, email <color rgb='0000ff'><u>#{state.fetch(:company_email)}</u><color>", :inline_format => true, :align=> :center

      end
    end

    def build_table
      data = [
              ["Payment date", state.fetch(:payment_date) {Time.now.strftime "%B %e, %Y "}],
              ["Account billed", "$#{state.fetch(:amount_billed)} USD"],
              ["Account charged", "#{state.fetch(:customer_name)}(#{state.fetch(:customer_email)})"],
              ["Charged to", state.fetch(:credit_card)],
              ["Transaction ID", state.fetch(:transaction_id)]
             ]

      move_down 20

      table data, :row_colors => ["FFFFFF", "EDEEEE"],
                  :position => :center,
                  :width => 400 do |t|
        apply_common_styling(t, data.length)
      end



      move_down 20
    end

    private

    def apply_common_styling(t, size)
      t.instance_eval do
        cells.style(:padding => 10)

        column(0).style(:font_style => :bold, :borders => [:left], :width => width*0.4)
        column(1).style(:borders => [:right], :width => width*0.6)

        row(0).style { |c| c.borders += [:top] }

        row(size - 1).style do |c|
          c.borders += [:bottom]
        end
      end
    end
  end
end
