module ERBHelper
  def self.erb_to_string(path)
    File.open(Rails.root.join(path)) do |file|
      ERB.new(file.read).result
    end
  end
end
