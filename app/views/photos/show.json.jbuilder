# TODO: add outer json map
@images.each do |image|
    json.id image['public_id'] 
    json.url image['secure_url']
end