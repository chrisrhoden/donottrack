module Rack
  class DoNotTrack
    DEFAULT_DNT_BIT = 0

    def initialize(app, dnt_bit = nil)
      @app = app
      @dnt_bit = dnt_bit
    end

    def call(env)
      env['HTTP_DNT'] = @dnt_bit.nil? ? @dnt_bit : (env['HTTP_DNT'] || env['HTTP_X_DO_NOT_TRACK'] || DEFAULT_DNT_BIT)
      @app.call(env)
    end
  end
end