require 'date'

class Referencia
    include Comparable
    attr_reader :autores, :titulo, :editorial, :fecha_publicacion
    
    def initialize(autores, titulo, editorial, fecha_publicacion)
        raise ArgumentError, "Autores debe ser un array" unless autores.is_a?(Array)
        raise ArgumentError, "Autores debe tener al menos 1 valor" unless autores.size >= 1
        raise ArgumentError, "Título debe se un string" unless titulo.is_a?(String)
        raise ArgumentError, "Editorial debe se un string" unless editorial.is_a?(String)
        raise ArgumentError, "Fecha debe se un string (dd-mm-yyyy)" unless fecha_publicacion.is_a?(String)
        
        @autores = autores
        @autores.sort       #ordenamos los autores
        @titulo = titulo
        @fecha_publicacion = Date.parse(fecha_publicacion)
        @editorial = editorial
    end
    
    def <=>(other)
        # devolvemos nil si no son del tipo Referencia
        return nil unless other.is_a? Referencia
        # realizamos las comparaciones necesarias
        return @autores <=> other.autores unless @autores & other.autores == @autores
        return @titulo <=> other.titulo unless @titulo == other.titulo
        return @fecha_publicacion <=> other.fecha_publicacion
    end
    
end