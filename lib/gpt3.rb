class Gpt3
  require "ruby/openai"

  def self.classify(message)
    response = client.classifications(parameters: {
        examples: [
            ["My laptop does not work", "IT"],["the office internet is dead", "IT"],
        ["Delivery for client #111 is lost", "Sales"],
        ["The monthly revenue report is wrong, total income is under the average", "Administration"],
        ["the web platform is too slow", "IT"],
        ["I forgot my user credentials", "IT"],
        ["Many customers has been reporting problems with the quality of our new product", "Marketing"],
        ["Hola, tengo un problema con las facturas de ventas, se están creado con el valor de deducciones incorrecto", "Accounting"],
        ["Perdí las llaves de la bodega de suministros, necesito unas nuevas", 'Logistics']
        ],
        query: message,
        model: "davinci"
    })
    response['label']
  end

  def self.completions(text)
    response = client.completions(engine: "text-davinci-001", parameters: { prompt: text, max_tokens: 10 })
    response.parsed_response['choices'].map{ |c| c["text"] }.first
  end

  private
  def self.client
    token = (Rails.env == 'production' ? ENV['OPEN_AI_KEY'] : Rails.application.credentials.open_ai[:key])
    OpenAI::Client.new(access_token: token)
  end

end