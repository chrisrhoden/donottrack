module Rack
  class DoNotTrack < Struct.new(:app, :dnt_bit)
    DEFAULT_DNT_BIT = 0

    def call(env)
      env['HTTP_DNT'] = self[:dnt_bit] ? self[:dnt_bit] : (env['HTTP_DNT'] || env['HTTP_X_DO_NOT_TRACK'] || DEFAULT_DNT_BIT)
      self[:app].call(env)
    end
  end
end