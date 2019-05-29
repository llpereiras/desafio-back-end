class StoreService

  def self.save(owner, name)

    store = Store.where(owner: owner, name: name)
    return store.first if store.size > 0

    store = Store.create({owner: owner, name: name})

  end

end