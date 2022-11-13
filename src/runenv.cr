require "poncho"

def main
  poncho, cmd, args = case ARGV.size
  when 0
    exit(0)
  when 1
    if File.exists?(".env")
      {Poncho.from_file(".env"), ARGV.first, nil}
    else
      {Poncho.parse(""), ARGV.first, nil}
    end
  else
    filename = ARGV.first
    if File.exists?(filename) && filename =~ /\.env/
      {Poncho.from_file(filename), ARGV.skip(1).first, ARGV.skip(2)}
    elsif File.exists?(".env")
      {Poncho.from_file(filename), ARGV.first, ARGV.skip(1)}
    else
      {Poncho.parse(""), ARGV.first, ARGV.skip(1)}
    end
  end
  file_env = poncho.to_h
  env = ENV.to_h.merge(file_env)
  Process.exec(cmd, args, env)
end

main
