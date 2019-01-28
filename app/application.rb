class Application

    def call(env)
        resp= Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
            item_name = req.path.split("/items/").last

            item_p = @@items.find {|item| item.name == item_name}
            if item_p == nil
                resp.write "Item not found"
                resp.status=400
            else
                resp.write item_p.price
                resp.status=200
            end
        else
            resp.write "Route not found"
            resp.status=404
        end
        
        resp.finish
    end
end
