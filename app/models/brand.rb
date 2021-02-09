class Brand < ActiveResource::Base
	self.site = "http://localhost:3001/"
	has_many :components

	validates :name, :country, presence: true
	validate :countreia

	def countreia #FILTRO PERSONALIZADO
		if self.country.downcase == "argentina"
			errors.add(:country, "No puede ser Argentina porque somos unos desgraciados")
		end
	end

	def self.filtername(name)  # FILTRA NOMBRE BUSQUEDA BLANDA
        flights = []

        name = name.downcase

        for v in Brand.all
            ap = v.name.downcase
            if ap.include?(name)
                puts v.name
                flights.push(v)
            end
        end

        flights

    end

    def self.filtercountreia(country)  # FILTRA COUNTRY BUSQUEDA BLANDA
        brands = []

        country = country.downcase

        for v in Brand.all
            ap = v.country.downcase
            if ap.include?(country)
                puts v.country
                brands.push(v)
            end
        end

        brands

    end

    def self.filterambos(name,country)  # FILTRA COUNTRY BUSQUEDA BLANDA
        brands = []

        country = country.downcase
        name = name.downcase

        for v in Brand.all
            ap = v.country.downcase
            ap1 = v.name.downcase
            if ap.include?(country) and ap1.include?(name)
                brands.push(v)       
            end
        end

        brands

    end
end
