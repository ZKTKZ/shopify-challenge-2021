@images.each do |resource|
    # TODO: add outer json map
    json.id resource['public_id'] 
    json.url resource['secure_url']
end