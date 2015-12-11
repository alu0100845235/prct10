# encoding: utf-8
class Revista < Publicacion
    attr_reader :numero
    
    def initialize(autores, titulo, revista, fecha_publicacion, numero, pagina_inicio, pagina_fin, issn)
        super(autores, titulo, revista, fecha_publicacion, pagina_inicio, pagina_fin, issn)
        
        raise ArgumentError, "Numero de revista debe ser un numero" unless numero.is_a?(Numeric)
        
        @numero = numero
    end
    
    def to_s
        salida=""
        # autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."
        if @autores.length > 1
            str_autores.sub(", " + autores.last, "& " + autores.last + ".")
        end
        
        if(@pfin != nil)
            salida = "#{str_autores} (#{@fecha_publicacion.strftime("%d, %B %Y")}).\n\t#{@titulo}. #{@editorial}, N. #{@numero}.\n\tp. #{@pinicio} - #{@pfinal}.\n\tISSN: #{@ISSN}"
        else
            salida = "#{str_autores} (#{@fecha_publicacion.strftime("%d, %B %Y")}).\n\t#{@titulo}. #{@editorial}, N. #{@numero}.\n\tp. #{@pinicio}.\n\tISSN: #{@ISSN}"
        end
        salida
    end
end
