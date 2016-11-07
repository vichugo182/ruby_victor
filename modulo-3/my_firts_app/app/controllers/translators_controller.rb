class TranslatorsController < ApplicationController
  def translate
  	@google = GoogleTranslate.new("en", "es")
  	@trans = params[:text] || "This is a really good party!"
  	@response = @google.translate(@trans)
  	@translations = @response['data']['translations'][0]['translatedText']
  end

  def detect
  	@trans = "This is a really party!"
  	@detection = GoogleTranslate.detect(@trans)
  	puts "#{@detection}"
  end

  def lenguages
  	@target_language = "fr"
  	@languages = GoogleTranslate.languages(@target_language)
  	puts "Es posible traducir desde los siguientes idiomas: #{@languages}"
  end
end
