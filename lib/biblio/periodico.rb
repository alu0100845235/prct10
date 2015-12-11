# encoding: utf-8
class Periodico < Publicacion
    
    def to_s
        salida=""
        # autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."
        str_autores.sub(", &", "&")
        
        if(@pfin != nil)
            salida = "#{str_autores} (#{@fecha_publicacion.strftime("%d, %B %Y")}).\n#{@titulo}. #{@editorial}.\np. #{@pinicio} - #{@pfinal}.\nISSN: #{@ISSN}"
        else
            salida = "#{str_autores} (#{@fecha_publicacion.strftime("%d, %B %Y")}).\n#{@titulo}. #{@editorial}.\np. #{@pinicio}.\nISSN: #{@ISSN}"
        end
        salida
    end
end
