class Building
  attr_reader :id
  attr_accessor :name, :address, :height, :construction_date, :architect

  def initialize(input_options)
    @id = input_options["id"]
    @name = input_options["name"]
    @address = input_options["address"] 
    @height = input_options["height"]
    @construction_date = input_options["construction_date"]
    @architect = input_options["architect"]
  end

  def self.find(input_id)
    response = HTTP.get("http://localhost:3000/api/buildings/#{ input_id }")
    building_data = response.parse 
    Building.new(building_data)
  end

  def self.all
    response = HTTP.get("http://localhost:3000/api/buildings")
    all_building_data = response.parse
    all_building_data.map do |building_data|
      Building.new(building_data)
    end 
  end

  def self.create(building_attributes)
    response = HTTP.post("http://localhost:3000/api/buildings",
              form: building_attributes
              )
    new_building_data = response.parse
    new_building = Building.new(new_building_data)
  end

end