namespace :assets do
  require 'sprockets'

  desc 'compile assets'
  task :compile => [:compile_js, :compile_css] do
  end

  desc 'compile javascript assets'
  task :compile_js => :environment do
    sprockets = Sprockets::Environment.new
    sprockets.append_path 'app/assets/javascripts'
    asset     = sprockets['application.js'] || sprockets['application.coffee']
    outpath   = File.join('public', 'assets')
    outfile   = Pathname.new(outpath).join('application.js') # may want to use the digest in the future?

    FileUtils.mkdir_p outfile.dirname

    asset.write_to(outfile)
    puts "successfully compiled js assets"
  end

  desc 'compile css assets'
  task :compile_css => :environment do
    sprockets = Sprockets::Environment.new
    sprockets.append_path 'app/assets/stylesheets'
    asset     = sprockets['application.css'] || sprockets['application.scss']
    outpath   = File.join('public', 'assets')
    outfile   = Pathname.new(outpath).join('application.css') # may want to use the digest in the future?

    FileUtils.mkdir_p outfile.dirname

    asset.write_to(outfile)
    puts "successfully compiled css assets"
  end

end