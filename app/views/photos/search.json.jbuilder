@images.each_with_index do |image, index|
    json.set! index do
        json.id image['public_id'] 
        json.url image['secure_url']
    end
end