#ENV["GEM_HOME"] = File.expand_path('../../vendor/bundler_gems', __FILE__)

begin
  # Require the preresolved locked set of gems.
  require File.expand_path('../../.bundle/environment', __FILE__)
rescue LoadError
  raise RuntimeError, "You have not locked your bundle. Run `bundle lock`."
 
  # Fallback on doing the resolve at runtime.
  # This does not work with rails 2.3.5 as of bundler 0.9.5.
  require "rubygems"
  require "bundler"
  Bundler.setup
end