class Application
  
  @@items=["Milk", "Eggs", "Apple"]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/items/"
      item_name = req.path.split("/items/").last
      item = @@items.find{|s| item.name == item_name}
 
      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 400
    end
 
    resp.finish
  end
end