require "#{ File.dirname(__FILE__) }/boot"

run Rack::URLMap.new(
      "/"     => FrontEndApp,
      "/info" => ApiApp
    )
