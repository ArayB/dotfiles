require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir.each_child('config_files') do |file|
    next if %w[init.vim sass-lint.yml].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file, 'config_files', file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file, 'config_files', file)
        when 'y'
          replace_file(file, 'config_files', file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file, 'config_files', file)
    end
  end

  # Handle neovim init.vim
  system %Q{mkdir -p "$HOME/.config/nvim"}
  system %Q{ln -s "$PWD/config_files/init.vim" "$HOME/.config/nvim/init.vim"}

  # Handle neovim sass-lint.yml
  system %Q{ln -s "$PWD/config_files/sass-lint.yml" "$HOME/sass-lint.yml"}

  # Link ohmyzshthemes
  system %Q{ln -s "$PWD/ohmyzshthemes/themes"  "$HOME/.oh-my-zsh/custom"}

  # Link ultisnips directories
  system %Q{ln -s "$PWD/UltiSnips" "$HOME/.vim"}

  # copy solarized color scheme to .vim folder
  system %Q{mkdir -p "$HOME/.vim/colors"}
  system %Q{cp "$PWD/solarized/solarized.vim" "$HOME/.vim/colors/solarized.vim"}

  # Link the local config files
  Dir.each_child('local_config_files') do |file|
      parts = file.split('.')
      parts.delete(parts.last)
      dest_file = parts.join('.')
      puts "dest_file: #{dest_file}"
    print "link local file? .#{file}? [yn]"
    case $stdin.gets.chomp
    when 'y'
      if File.exist?(File.join(ENV['HOME'], ".#{dest_file}"))
        replace_file(file, 'local_config_files', dest_file)
      else
        link_file(file, 'local_config_files', dest_file)
      end
    else
      puts "skipping .#{file}"
    end
  end
end

def replace_file(source_file, dir, dest_file)
  system %Q{rm "$HOME/.#{dest_file}"}
  link_file(source_file, dir, dest_file)
end

def link_file(source_file, dir, dest_file)
  puts "linking ~/.#{dest_file}"
  system %Q{ln -s "$PWD/#{dir}/#{source_file}" "$HOME/.#{dest_file}"}
end
