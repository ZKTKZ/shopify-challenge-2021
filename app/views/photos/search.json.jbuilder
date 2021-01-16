@resources.each do |resource|
    # TODO: index with '.' operator
    # TODO: add outer json map
    json.id resource['public_id'] 
    json.url resource['secure_url']
end