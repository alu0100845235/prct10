# encoding: utf-8
class Libro < Referencia
    attr_reader :serie, :n_edicion, :isbn
    
    def initialize(autores, titulo, serie, editorial, n_edicion, fecha_publicacion, isbn)
        super(autores, titulo, editorial, fecha_publicacion)
        
        if !serie.nil?
            raise ArgumentError, "La serie debe se un string" unless serie.is_a?(String)
        end
        raise ArgumentError, "Número de edicion debe se un numero" unless n_edicion.is_a?(Numeric)
        raise ArgumentError, "ISBN debe se un array" unless isbn.is_a?(Array)
        raise ArgumentError, "ISBN debe tener al menos 1 valor" unless isbn.size >= 1
        
        @serie = serie
        @n_edicion = n_edicion
        @isbn = isbn
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
        
        # isbn
        str_isbn = ""
        @isbn.each do |n_isbn|
            if n_isbn.length > 10
                str_isbn += "ISBN-13: #{n_isbn}\n\t"
            else
                str_isbn += "ISBN-10: #{n_isbn}\n\t"
            end
        end
        
        #
        if @sufijo
            str_sufijo = " " + @sufijo
        else
            str_sufijo = ""
        end
        
        if(serie != nil)
            salida = "#{str_autores}\n\t#{titulo}\n\t#{serie}\n\t#{@editorial}; #{@n_edicion} edición (#{@fecha_publicacion.strftime("%d, %B %Y")}#{str_sufijo})\n\t#{str_isbn}"
        else
            salida = "#{str_autores}\n\t#{titulo}\n\t#{@editorial}; #{@n_edicion} edición (#{@fecha_publicacion.strftime("%d, %B %Y")}#{str_sufijo})\n\t#{str_isbn}"
        end
        salida
    end
end
