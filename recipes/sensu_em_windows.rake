Bunchr::Software.new do |t|
  t.name = 'sensu_em_windows'
  t.version = '2.5.0.beta'
  t.work_dir = "sensu-em-#{t.version}"

  t.download_commands << "curl -O https://github.com/sensu/sensu-em/archive/v#{t.version}.tar.gz"
  t.download_commands << "tar xfvz sensu-em-#{t.version}.tar.gz"

  install_prefix = "#{Bunchr.install_dir}\\embedded"

  embedded_bundler = "#{install_prefix}\\bin\\bundle"

  t.build_commands << "#{embedded_bundler} install"
  t.build_commands << "#{embedded_bundler} exec rake compile"
  t.build_commands << "#{embedded_bundler} exec rake gem"

  t.install_commands << "#{install_prefix}\\bin\\gem install pkg\\sensu-em-#{t.version}"

  CLEAN << install_prefix
end
