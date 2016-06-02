module APIHelpers
  def api_get(url)
    get "/api#{url}"
  end

  def api_post(url, payload)
    post "/api#{url}", payload
  end

  def api_put(url, payload)
    put "/api#{url}", payload
  end

  def api_delete(url)
    delete "/api#{url}"
  end
end
