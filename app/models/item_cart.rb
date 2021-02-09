class ItemCart < ActiveResource::Base
	self.site = "http://localhost:3001/"
	belongs_to :component
	belongs_to :cart

    validates :quantity, :unit_price, numericality: true
    validates :quantity, :unit_price, presence: true

	def pricetotal
        price = 0

        price = self.quantity * self.unit_price

        if self.component.rgb == true
            price = price * 1.25

        end

        price

    end

    def self.filterb_m(b_m) # FILTRA POR MODELO  O MARCA CUALQUIERA DE LAS DOS
        items = []

        b_m = b_m.downcase

        for a in ItemCart.all
            m = a.component.model.downcase
            b = a.component.brand.name.downcase

            if m.include?(b_m) or b.include?(b_m)
                count = 0
                for a2 in items
                    if a2 == a
                        count = count + 1
                    end
                end
                if count == 0
                    items.push(a)
                end
            end
        end

        items
    end

    def self.filterperprice(min, max) # FILTRA POR PRECIO USANDO LA VARIABLE DE ARRIBA QUE CALCULA EL PRECIO TOTAL
        items = []

        min = min.to_f
        max = max.to_f

        for i in ItemCart.all
            if i.pricetotal >= min and i.pricetotal <= max
                items.push(i)
            end
        end

        items

    end



end
