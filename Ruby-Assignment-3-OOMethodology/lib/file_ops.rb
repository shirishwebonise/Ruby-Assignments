
module FileOps
  # Read the give file and create objects
  def self.readFile(fileName)
    dbStore = PStore.new(fileName)
    data = Array.new 

    dbStore.transaction(true) do
      dbStore.roots.each do |data_root_name|
        data.push dbStore[data_root_name]
      end
    end

    return data
  end

  # write data to file
  def self.saveToFile(fileName, data, key)
    dbStore = PStore.new(fileName)

    dbStore.transaction do
      dbStore[key] = data
    end
  end

  # remove data from file
  def self.deleteFromFile(fileName, object)
    fileContent = PStore.new(fileName)

    fileContent.transaction do
      fileContent.delete(object)
    end
  end
end
