class Edocumento < Publicacion
    attr_reader :url
    
    def initialize(autores, titulo, revista, fecha_publicacion, pagina_inicio, pagina_fin, issn, url)
        super(autores, titulo, revista, fecha_publicacion, pagina_inicio, pagina_fin, issn)
        
        raise ArgumentError, "La url debe ser de tipo String" unless url.is_a?(String)
        
        @url = url
    end
    
    def to_s
        salida=""
        # autores
        str_autores = ""
        @autores.each do |autor|
            str_autores += autor + ", "
        end
        str_autores = str_autores[0, str_autores.length - 2] + "."
        
        if(@pfin != nil)
            salida = "#{str_autores} (#{@fecha_publicacion.strftime("%d, %B %Y")}).\n#{@titulo}. #{@editorial}.\np. #{@pinicio} - #{@pfinal}.\nISSN: #{@ISSN}\nurl: #{@url}"
        else
            salida = "#{str_autores} (#{@fecha_publicacion.strftime("%d, %B %Y")}).\n#{@titulo}. #{@editorial}.\np. #{@pinicio}.\nISSN: #{@ISSN}\nurl: #{@url}"
        end
        salida
    end
end
