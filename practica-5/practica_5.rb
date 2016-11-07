class AnalizadorLinea
	attr_reader :max_frec_count, :max_frec_palabras, :content, :numero_linea
	
	def initialize(content, numero_linea )
		@content= content
		@numero_linea = numero_linea
		@max_frec_palabras = []
		@max_frec_count = 0
		calcular_frecuencia_palabras()
	end

	def calcular_frecuencia_palabras()
		frecuencia = Hash.new(0)
		@content.split.each() do |word|
			frecuencia[word.downcase]+=1
		end
		@max_frec_count = frecuencia.values.max
		frecuencia.each do |key, value|
			if(@max_frec_count == value)
				@max_frec_palabras.push(key)
			end
		end
	end
end


class Solution
	attr_reader :max_count_across_lines, :max_count_palabras_across_lines, :analizadores

	def initialize()
		@analizadores = []
	end

	def analizar_archivo()
		if File.exist? 'test.txt'
			numero_linea = 0
			File.foreach('test.txt') do |line|
				numero_linea +=1
				analizador = AnalizadorLinea.new(line.chomp, numero_linea)
				@analizadores.push(analizador)
			end
		end
	end

	def calcular_linea_mayor_frecuencia()
		@max_count_across_lines = 0
		@max_count_palabras_across_lines = []
		@analizadores.each do |analizador|
			if(@max_count_across_lines < analizador.max_frec_count )
				@max_count_across_lines = analizador.max_frec_count
			end
		end

		@analizadores.each do |analizador|
			if(@max_count_across_lines == analizador.max_frec_count )
				@max_count_palabras_across_lines.push(analizador)
			end	
		end
	end

	def print_palabras_mayor_frecuencia()
		@max_count_palabras_across_lines.each do |analizador|
			analizador.max_frec_palabras.each do |word|
				puts "#{word} aparace en la linea #{analizador.numero_linea}"
			end
		end
	end
end

solution = Solution.new
solution.analizar_archivo
solution.calcular_linea_mayor_frecuencia
solution.print_palabras_mayor_frecuencia