puts "Create user....."
User.create!(email: "admin@admin.com", password: "12345678", password_confirmation: "12345678")
puts "Create client....."
(1..10).each do |i|
  Client.create!(name: "Client #{i}", address: "Address", email: "client#{i}@client.com")
end
puts "Create product....."
Product.create!(name: "Database", unit: "Gigabytes", price: 20, description: "description")
Product.create!(name: "Logical Serve", unit: "Qtd. Physical Processors", price: 100, description: "description")
Product.create!(name: "Virtual Server ", unit: "Qtd. Virtual Processors", price: 50, description: "description")
Product.create!(name: "API Management", unit: "Requests", price: 4.5, description: "description")
puts "Create done!"
