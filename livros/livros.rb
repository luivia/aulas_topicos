#def salvar_livro(livro_attrs = {})
#  File.open("livros.rb", "a") do |livro|
#    livro_attrs.each {|k,v| livro.puts "#{k}: #{v}"}
#  end
#end

#def condicional_saida(condicional)
#  return false if condicional == 2
#  return true
#end
#init = true
#while init
require 'yaml'

class Livros
  attr_accessor :titulo, :categoria, :autor, :isbn, :id #acessa os atributos, setters e getters, leitura e escrita

  def initialize (titulo, categoria, autor, isbn)
    @titulo = titulo #@ deixa o atributo disponivel durante toda a classe
    @categoria = categoria
    @autor = autor
    @isbn = isbn
  end
end

class Biblioteca
  #attr_reader :livros

  #def initialize

  #end

  def self.salvar(livro)
    livro.id = quantidade_registros
    File.open("db/livros/#{livro.id}.yml", "a") do |arquivo|
      arquivo.puts YAML.dump(livro)
      arquivo.puts ""
    end
  end

  def self.listar
      @livros = []
      $/ = "\n\n"
    File.open("livros.yml", "r").each do |arquivo|
      livros = YAML.load arquivo
      @livros << livros
  end
      @livros
  end

  def self.selecionar(titulo)
    listar.each do |livro|
        return livro if livro.titulo == titulo
    end
  end

  def self.atualizar(livro)

  end

  def self.quantidade_registros
    Dir.glob("db/livros/*.yml").size + 1
  end

  def self.ultimo_id
    files = Dir.entries("db/livros").sort_by do |file|
      File.birthtime("db/livros/#{file}")
    end
    File.basename "db/livros/#{file.last}" , ".yml"
  end

end
#
# livro = Livros.new "A Cabana", "Ficção", "Não lembro", "não sei"
# Biblioteca.salvar(livro)
#
# livro = Livros.new "Cidades de Papel", "Ficção", "John Green", "não sei"
# Biblioteca.salvar(livro)
#
#  livro = Livros.new "Wake", "Ficção", "Lisa Maccman", "não sei"
#  Biblioteca.salvar(livro)
# #
 livro = Livros.new "Teste4", "Teste4", "Teste4", "Teste4"
 Biblioteca.salvar(livro)
#puts Biblioteca.selecionar("Teste3")
