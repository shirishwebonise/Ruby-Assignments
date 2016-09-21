
module CollectionErrors
  class ListError < StandardError
    def initialize(msg)
      msg = "ListError... " + msg
      super(msg)
    end
  end

  class ListOverflowError < ListError
    def initialize(msg="List overflow condition reached")
      super(msg)
    end
  end

  class StackUnderflowError < ListError
    def initialize(msg="Stack underflow condition reached")
      super(msg)
    end
  end

  class QueueUnderflowError < ListError
    def initialize(msg="Queue underflow condition reached")
      super(msg)
    end
  end
end
