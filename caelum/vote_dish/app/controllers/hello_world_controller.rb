class HelloWorldController < ApplicationController
  helper_method :test

  def test
    "algum conteudo dinâmico"
  end

  def action1
    render text: "ACTION 1!!!"
  end

  def action2
    redirect_to action: "action1"
  end

  #Escrever <%= teste %> na pagina
end
