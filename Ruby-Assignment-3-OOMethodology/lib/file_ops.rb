
module FileOps
  # Read the give file and create objects
  def self.read_file(file_name)
    db_store = PStore.new(file_name)
    data = Array.new 

    db_store.transaction(true) do
      db_store.roots.each do |data_root_name|
        data.push db_store[data_root_name]
      end
    end

    return data
  end

  # write data to file
  def self.save_to_file(file_name, data, key)
    db_store = PStore.new(file_name)

    db_store.transaction do
      db_store[key] = data
    end
  end

  # remove data from file
  def self.delete_from_file(file_name, object)
    file_content = PStore.new(file_name)

    file_content.transaction do
      file_content.delete(object)
    end
  end
end
