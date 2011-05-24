module Rack
  module DoNotTrack
    def self.new(app, dnt_bit=nil)
      Proc.new do |env| 
        env['HTTP_DNT'] = dnt_bit ? dnt_bit : (env['HTTP_DNT'] || env['HTTP_X_DO_NOT_TRACK'] || 0)
        app.call(env)
      end
    end
  end
end