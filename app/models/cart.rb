class Cart < ActiveResource::Base
	self.site = "http://localhost:3001/"
	has_many :item_carts

    

	def finalprice
        pricetotal = 0
        for i in ItemCart.all
            if i.cart == self
                count = i.pricetotal
                pricetotal = pricetotal + count
            end
        end
        pricetotal
    end

    def self.filteruname(uname)  # FILTRA NOMBRE BUSQUEDA BLANDA
        flights = []

        uname = uname.downcase

        for v in Cart.all
            ap = v.user_name.downcase
            if ap.include?(uname)
                puts v.user_name
                flights.push(v)
            end
        end

        flights
    end

    def self.filterfromto(from, to)  # FILTRA DESDE UNA FECHA A LA OTRA
        carts = []
        if (from == "" ) or (to == "")
            carts = Cart.all
        else
            from = from.to_date
            to = to.to_date
            for v in Cart.all
                condition = 0
                if (v.bill_date.to_date > from)
                    condition = condition + 1
                end

                if (v.bill_date.to_date < to)
                    condition = condition + 1
                end

                if (condition == 2)
                    carts.push(v)
                end
            end
            carts
        end

    end

    def self.filterprice(max)  # FILTRA TODOS LOS PRECIOS QUE ESTEN POR DEBAJO DE MAX
        carts = []
        max = max.to_f
        for i in Cart.all
            if i.finalprice < max
               carts.push(i) 
            end 
        end

        carts
    end

    def self.filterbrand(brand_id) # RECORRO PARA FILTRAR POR MARCA LISTA DESPLEGABLE
        carts = []

        for c in Cart.all
            for i in ItemCart.all
                if i.cart == c and i.component.brand.id.to_i == brand_id.to_i
                    carts.push(c)
                end
            end
        end

        carts

    end

    def self.filterperunit(minimum,maximum) # RECORRO PARA FILTRAR POR MAXIMO Y MINIMO PRECIO UNITARIO
        carts = []

        minimum = minimum.to_f
        maximum = maximum.to_f

        for c in Cart.all
            for i in ItemCart.all
                if i.cart == c and i.unit_price.to_f >= minimum.to_i and i.unit_price.to_f <= maximum.to_i
                    count = 0
                    for j in carts
                        if j == c 
                            count = count + 1
                        end
                    end
                    if count = 0
                        carts.push(c)
                    end
                end
            end
        end

        carts

    end
end
