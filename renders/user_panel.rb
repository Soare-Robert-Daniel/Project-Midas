require 'erb'

class UserPanel 
    attr_reader :panel, :name, :status

    def initialize(template_path)
        @panel = ERB.new(File.read(template_path))
    end

    def build(user_name = 'none', user_status = 'none')
        # Set the bindings
        # @name, @status = getDataFromDatebase()
        @name = user_name
        @status = user_status
    end

    def getHTML()
        @panel.result binding
    end

    def getDataFromDatebase()
        name = "Vlad"
        status = "Poor"
        return [name, status]
    end
end