module Rack
  module DoNotTrack
    def self.new(app, dnt_bit=nil)
      Proc.new {|env| app.call(env.merge('HTTP_DNT'=> dnt_bit ? dnt_bit : (env['HTTP_DNT'] || env['HTTP_X_DO_NOT_TRACK'] || 0)))}
    end
  end
end