require 'erb'

class UserPanel 
    attr_reader :panel, :name, :status

    def initialize(template_path)
        @panel = ERB.new(File.read(template_path))
    end

    def build()
        # Set the bindings
        @name, @status = getDataFromDatebase()
        binding
    end

    def getHTML()
        @panel.result build
    end

    def getDataFromDatebase()
        name = "Vlad"
        status = "Poor"
        return [name, status]
    end
end