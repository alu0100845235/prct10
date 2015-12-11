# encoding: utf-8
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
        
        # Formateamos los autores
        i=0
        while(i < autores.length)
            raise ArgumentError, "Los autores deben ser un String" unless autores[i].is_a?(String)
            raise ArgumentError, "El nombre del autor debe tener contener nombre y apellido" unless autores[i].length > 1
            
            aux = autores[i].split
            name = aux.pop + ", "
            aux.each do |n|
                if n.length > 0
                    name << n[0] + ". "
                end
            end
            autores[i] = name[0..-2]
            i = i + 1
        end
        autores = autores.sort
        
        # Formateamos el título
        aux = titulo.split
        aux.each do |p|
            if p.length > 2
                p.capitalize!
            else
                p.downcase!
            end
        end
        titulo = aux.join " "
        
        # Asignamos los valores a las atributos
        @autores = autores 
        @titulo = titulo
        @fecha_publicacion = Date.parse(fecha_publicacion)
        @editorial = editorial
        @sufijo = nil
    end
    
    def <=>(other)
        # devolvemos nil si no son del tipo Referencia
        return nil unless other.is_a? Referencia
        # realizamos las comparaciones necesarias
        
        # Comprobamos si tienen el mismo apellido del primer autor, ordenamos por el primer autor
        return @autores.first <=> other.autores.first unless @autores.first == other.autores.first
        # Comprobamos cantidad de autores, priorizamos los que tengan menor numero de autores
        return @autores.length <=> other.autores.length unless @autores.length == other.autores.length
        # Comprobamos son exactamente los mismos autores, si no lo son ordenamos por la lista completa de autores
        return @autores <=> other.autores unless @autores & other.autores == @autores
        # Ordenamos por año de publicacion
        return @fecha_publicacion.year <=> other.fecha_publicacion.year unless @fecha_publicacion.year == other.fecha_publicacion.year
        # Ordenamos por titulo
        if @titulo != other.titulo
            mes = ["ENE", "FEB", "MAR", "ABR", "MAY", "JUN", "JUL", "AGO", "SEP", "OPT", "NOV", "DIC"]
            @sufijo = mes[@fecha_publicacion.mon]
            #other.sufijo = mes[other.fecha_publicacion.mon]
            return @titulo <=> other.titulo
        else
            return 0
        end
    end
end