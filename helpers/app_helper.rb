module ApplicationHelper
    def title(value = nil)
      @title = value if value
      @title ? "#{@title}" : "This tab need a name"
    end

    def userDefault()
      "this is the user"
    end
end