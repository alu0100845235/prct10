class Publicacion < Referencia
    attr_reader :pinicio, :pfin, :issn
    
    def initialize(autores, titulo, periodico, fecha_publicacion, pagina_inicio, pagina_fin, issn)
        super(autores, titulo, periodico, fecha_publicacion)
        
        raise ArgumentError, "Pagina de inicio debe ser un numero" unless pagina_inicio.is_a?(Numeric)
        if !pfin.nil?
            raise ArgumentError, "Pagina final debe ser un numero" unless pagina_fin.is_a?(Numeric)
        end
        raise ArgumentError, "La serie debe se un string" unless issn.is_a?(String)
        
        @pinicio = pagina_fin
        @pfin = pagina_fin
        @issn = issn
    end
    
end
