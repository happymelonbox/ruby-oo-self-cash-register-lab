require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_trasaction
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

    def add_item(title, price, quantity = 1)
        @last_transaction = price * quantity
        number_of_item = 0
        until number_of_item == quantity
            @items << title
            number_of_item += 1
        end
        @total = @total + (price * quantity)
    end

    def apply_discount
        if @discount > 0
            @total = @total * (1-(@discount.to_f/100))
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        return @items
    end

    def void_last_transaction
       @total = @total - @last_transaction
       @items.pop
       if items.size == 0
        @total = 0
       end
    end
end

