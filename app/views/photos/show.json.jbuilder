@images.each do |image|
    # TODO: add outer json map
    json.id image['public_id'] 
    json.url image['secure_url']
end