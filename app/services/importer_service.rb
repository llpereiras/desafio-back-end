class ImporterService

  def self.execute(data, import_info)

    result_itens = 0
    result_sales = 0
    errors = ""
    @stories = []

    data.each do |line|

      line = prepare_line(line)

      transaction = TypeTransaction.find_by_id(line[:type])

      unless transaction
        errors = errors + "Transaction ID #{line[:type]} not found | "
        next
      end

      recipient = RecipientService.save(line[:cpf])

      store = StoreService.save(line[:owner], line[:store])

      check_stories(store)

      moviment = {type_transaction: transaction,
                         recipient: recipient,
                             store: store,
                          datetime: line[:datetime],
                          amount: line[:amount],
                              card: line[:card],
                              import_info: import_info}
      moviment = ::MovementService.save(moviment)

    end

    movements = Movement.eager_load(:type_transaction, :recipient, :store).where(import_info: import_info).order(:store_id, :datetime)

    sum_store_movement(movements)

    results = {itens: movements.size, movements: @stories, errors: errors}

  end

  def self.sum_store_movement(movements)
    movements.each do |m|
      @stories.each do |s|
        s["sales"] = s["sales"].method(m.type_transaction.sinal).(m.amount.to_f) if s["id"] == m.store.id
      end
    end
  end

  def self.check_stories(store)

    add_store = JSON.parse( store.to_json )
    add_store["sales"] = 0
    @stories.each do |s|
      if s["id"] == (store.id)
        add_store = nil
        return
      end
    end

    @stories << add_store if add_store
  end

  def self.prepare_line(data)
    data = data.first
    datetime = DateTime.parse("#{data[1,8]} #{data[42,2]}:#{data[44,2]}:#{data[46,2]}")
    line = {}
    line[:type] = data[0,1]
    line[:datetime] = datetime
    line[:amount] = data[9,10].to_f / 100
    line[:cpf] = data[19,11]
    line[:card] = data[30,12]
    line[:owner] = data[48,14].strip
    line[:store] = data[62,19].strip
    line
  end

end