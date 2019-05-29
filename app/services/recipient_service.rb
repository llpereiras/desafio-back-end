class RecipientService

  def self.save(cpf)

    recipient = Recipient.find_by_cpf(cpf)

    if recipient.nil?
      recipient = Recipient.create({cpf: cpf})
    end

    recipient

  end

end