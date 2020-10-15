class Application
  
  @@items=["Milk", "Eggs", "Apple"]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/items/"
      item_name = req.path.split("/items/").last
      if item = @@items.find{|s| item.name == item_name}
        "#{item.price}"
      else
        resp.write "Route not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end