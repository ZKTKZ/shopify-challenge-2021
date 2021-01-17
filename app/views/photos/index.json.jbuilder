@images.each do |resource|
    json.id resource['public_id'] 
    json.url resource['secure_url']
end