class MainController < ApplicationController

  # remove this line and the tests will pass
  caches_action :index

  def index
    # bug: this header is only served for the first request; subsequent (cached)
    # responses will lose their 'Cache-Control' header.
    expires_in 10.minutes, public: true
  end

end
