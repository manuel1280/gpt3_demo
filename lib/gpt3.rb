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
    max_tokens = Rails.env == 'production' ? ENV['GPT_MAX_TOKENS'] : 30
    temperature = Rails.env == 'production' ? ENV['GPT_TEMPERATURE'] : 0.15
    model = Rails.env == 'production' ? ENV['GPT_MODEL'] : 'text-babbage-001'

    response = client.completions(engine: model, parameters: { prompt: text, max_tokens: max_tokens, temperature: temperature })
    response.parsed_response['choices'].map{ |c| c["text"] }.first
  end

  private
  def self.client
    token = (Rails.env == 'production' ? ENV['OPEN_AI_KEY'] : Rails.application.credentials.open_ai[:key])
    OpenAI::Client.new(access_token: token)
  end

end