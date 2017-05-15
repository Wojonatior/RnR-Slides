module RequestSpecHelper
  def json
    JSON.parse(response.body)
  end

  def api_prefix(url)
    "/api/v1" + url
  end
end
