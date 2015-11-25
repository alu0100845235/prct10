# encoding: utf-8
require 'spec_helper'

describe Biblio do
    before :each do
        @b1 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, "07/07/2013", ["978-1937785499", "1937785491"])
        @b2 = Libro.new(["Scott Chacon"], "Pro Git 2009th Edition", "Pro", "Apress" , 2009, "27/08/2009", ["978-1430218333", "1430218339"])
        @b3 = Libro.new(["David Flanagan", "Yukihiro Matsumoto"], "The Ruby Programming Language", nil, "O'Reilly Media", 1, "04/02/2008", ["0596516177", "978-0596516178"])
        @b4 = Libro.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Helleson"], "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends", "The Facets of Ruby", "Pragmatic Bookshelf", 1, "25/12/2010", ["1934356379", "978-1934356371"])
        @b5 = Libro.new(["Richard E"], "Silverman Git Pocket Guide", nil, "O'Reilly Media", 1, "02/08/2013", ["1449325866", "978-1449325862"])
        
        @p1 = Periodico.new(["autor"], "Titulo", "Periodico", "07/07/2013", 1, nil, "123456789")
        @p2 = Periodico.new(["autor1", "autor2"], "Titulo2", "Periodico2", "08/08/2013", 1, 2, "123456789")
        @p3 = Periodico.new(["autor"], "Titulo3", "Periodico3", "08/08/2013", 1, 100, "123456789")
        
        @r1 = Revista.new(["autor"], "Titulo", "Revista", "07/07/2013", 10, 1, nil, "123456789")
        @r2 = Revista.new(["autor1", "autor2"], "Titulo2", "Revista2", "08/08/2013", 11, 1, 2, "123456789")
        @r3 = Revista.new(["autor"], "Titulo3", "Revista3", "08/08/2013", 12, 1, 100, "123456789")
        
        @e1 = Edocumento.new(["autor"], "Titulo", "Revista", "07/07/2013", 1, nil, "123456789", "http://www.hola.com")
        @e2 = Edocumento.new(["autor1", "autor2"], "Titulo2", "Revista2", "08/08/2013", 1, 2, "123456789", "http://www.hastaluego.com")
        @e3 = Edocumento.new(["autor"], "Titulo3", "Revista3", "08/08/2013", 1, 100, "123456789", "http://www.chao.com")
    
        @l1 = List.new
        @l2 = List.new(@b1)
        @l3 = List.new(@p2)
        @l3.push_back(@p1)
    end
    
    describe "Comprobacion de la herencia de Libro" do
        it "Test herencia lista" do
            expect(@b1.is_a?Object).to be true
            expect(@b1.is_a?Referencia).to be true
            expect(@b1.instance_of?Libro).to be true
            expect(@b2.is_a?Object).to be true
            expect(@b2.is_a?Referencia).to be true
            expect(@b2.instance_of?Libro).to be true
            expect(@b3.is_a?Object).to be true
            expect(@b3.is_a?Referencia).to be true
            expect(@b3.instance_of?Libro).to be true
        end
    end
    
    describe "Comprobacion de la herencia de Periodico" do
        it "Test herencia lista" do
            expect(@p1.is_a?Object).to be true
            expect(@p1.is_a?Referencia).to be true
            expect(@p1.is_a?Publicacion).to be true
            expect(@p1.instance_of?Periodico).to be true
            expect(@p2.is_a?Object).to be true
            expect(@p2.is_a?Referencia).to be true
            expect(@p2.is_a?Publicacion).to be true
            expect(@p2.instance_of?Periodico).to be true
            expect(@p3.is_a?Object).to be true
            expect(@p3.is_a?Referencia).to be true
            expect(@p3.is_a?Publicacion).to be true
            expect(@p3.instance_of?Periodico).to be true
        end
    end
    
    describe "Comprobacion de la herencia de Revista" do
        it "Test herencia lista" do
            expect(@r1.is_a?Object).to be true
            expect(@r1.is_a?Referencia).to be true
            expect(@r1.is_a?Publicacion).to be true
            expect(@r1.instance_of?Revista).to be true
            expect(@r2.is_a?Object).to be true
            expect(@r2.is_a?Referencia).to be true
            expect(@r2.is_a?Publicacion).to be true
            expect(@r2.instance_of?Revista).to be true
            expect(@r3.is_a?Object).to be true
            expect(@r3.is_a?Referencia).to be true
            expect(@r3.is_a?Publicacion).to be true
            expect(@r3.instance_of?Revista).to be true
        end
    end
    
    describe "Comprobacion de la herencia de Documento Electronico" do
        it "Test herencia lista" do
            expect(@e1.is_a?Object).to be true
            expect(@e1.is_a?Referencia).to be true
            expect(@e1.is_a?Publicacion).to be true
            expect(@e1.instance_of?Edocumento).to be true
            expect(@e2.is_a?Object).to be true
            expect(@e2.is_a?Referencia).to be true
            expect(@e2.is_a?Publicacion).to be true
            expect(@e2.instance_of?Edocumento).to be true
            expect(@e3.is_a?Object).to be true
            expect(@e3.is_a?Referencia).to be true
            expect(@e3.is_a?Publicacion).to be true
            expect(@e3.instance_of?Edocumento).to be true
        end
    end
    
    describe "Comprobacion de la herencia de la lista" do
        it "Test herencia lista" do
            expect(@l1.is_a?Object).to be true
            expect(@l1.instance_of?List).to be true
            expect(@l2.is_a?Object).to be true
            expect(@l2.instance_of?List).to be true
        end
    end
    
    
    describe "Comprobacion de una correcta construccion de Libro" do
        it "Existe al menos un autor" do
            expect(@b1.autores).not_to eq(nil)
            expect(@b2.autores).not_to eq(nil)
            expect(@b3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@b1.titulo).not_to eq(nil)
            expect(@b2.titulo).not_to eq(nil)
            expect(@b3.titulo).not_to eq(nil)
        end
        it "Existe o no una serie" do
            expect(@b1.serie).not_to eq(nil)
            expect(@b2.serie).not_to eq(nil)
            expect(@b3.serie).to eq(nil)
        end
        it "Existe editorial" do
            expect(@b1.editorial).not_to eq(nil)
            expect(@b2.editorial).not_to eq(nil)
            expect(@b3.editorial).not_to eq(nil)
        end
        it "Existe edicion" do
            expect(@b1.n_edicion).not_to eq(nil)
            expect(@b2.n_edicion).not_to eq(nil)
            expect(@b3.n_edicion).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@b1.fecha_publicacion).not_to eq(nil)
            expect(@b2.fecha_publicacion).not_to eq(nil)
            expect(@b3.fecha_publicacion).not_to eq(nil)
        end
        it "Existe isbn" do
            expect(@b1.isbn).not_to eq(nil)
            expect(@b2.isbn).not_to eq(nil)
            expect(@b3.isbn).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de una correcta construccion de Periodico" do
        it "Existe al menos un autor" do
            expect(@p1.autores).not_to eq(nil)
            expect(@p2.autores).not_to eq(nil)
            expect(@p3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@p1.titulo).not_to eq(nil)
            expect(@p2.titulo).not_to eq(nil)
            expect(@p3.titulo).not_to eq(nil)
        end
        it "Existe editorial" do
            expect(@p1.editorial).not_to eq(nil)
            expect(@p2.editorial).not_to eq(nil)
            expect(@p3.editorial).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@p1.fecha_publicacion).not_to eq(nil)
            expect(@p2.fecha_publicacion).not_to eq(nil)
            expect(@p3.fecha_publicacion).not_to eq(nil)
        end
        it "Existe pagina de inicio" do
            expect(@p1.pinicio).not_to eq(nil)
            expect(@p2.pinicio).not_to eq(nil)
            expect(@p3.pinicio).not_to eq(nil)
        end
        it "Existe pagina de fin" do
            expect(@p1.pfin).to eq(nil)
            expect(@p2.pfin).not_to eq(nil)
            expect(@p3.pfin).not_to eq(nil)
        end
        it "Existe issn" do
            expect(@p1.issn).not_to eq(nil)
            expect(@p2.issn).not_to eq(nil)
            expect(@p3.issn).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de una correcta construccion de Revista" do
        it "Existe al menos un autor" do
            expect(@r1.autores).not_to eq(nil)
            expect(@r2.autores).not_to eq(nil)
            expect(@r3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@r1.titulo).not_to eq(nil)
            expect(@r2.titulo).not_to eq(nil)
            expect(@r3.titulo).not_to eq(nil)
        end
        it "Existe editorial" do
            expect(@r1.editorial).not_to eq(nil)
            expect(@r2.editorial).not_to eq(nil)
            expect(@r3.editorial).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@r1.fecha_publicacion).not_to eq(nil)
            expect(@r2.fecha_publicacion).not_to eq(nil)
            expect(@r3.fecha_publicacion).not_to eq(nil)
        end
        it "Existe pagina de inicio" do
            expect(@r1.pinicio).not_to eq(nil)
            expect(@r2.pinicio).not_to eq(nil)
            expect(@r3.pinicio).not_to eq(nil)
        end
        it "Existe pagina de fin" do
            expect(@r1.pfin).to eq(nil)
            expect(@r2.pfin).not_to eq(nil)
            expect(@r3.pfin).not_to eq(nil)
        end
        it "Existe issn" do
            expect(@r1.issn).not_to eq(nil)
            expect(@r2.issn).not_to eq(nil)
            expect(@r3.issn).not_to eq(nil)
        end
        it "Existe numero de revista" do
            expect(@r1.numero).not_to eq(nil)
            expect(@r2.numero).not_to eq(nil)
            expect(@r3.numero).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de una correcta construccion de Documento Electronico" do
        it "Existe al menos un autor" do
            expect(@e1.autores).not_to eq(nil)
            expect(@e2.autores).not_to eq(nil)
            expect(@e3.autores).not_to eq(nil)
        end
        it "Existe titulo" do
            expect(@e1.titulo).not_to eq(nil)
            expect(@e2.titulo).not_to eq(nil)
            expect(@e3.titulo).not_to eq(nil)
        end
        it "Existe editorial" do
            expect(@e1.editorial).not_to eq(nil)
            expect(@e2.editorial).not_to eq(nil)
            expect(@e3.editorial).not_to eq(nil)
        end
        it "Existe fecha" do
            expect(@e1.fecha_publicacion).not_to eq(nil)
            expect(@e2.fecha_publicacion).not_to eq(nil)
            expect(@e3.fecha_publicacion).not_to eq(nil)
        end
        it "Existe pagina de inicio" do
            expect(@e1.pinicio).not_to eq(nil)
            expect(@e2.pinicio).not_to eq(nil)
            expect(@e3.pinicio).not_to eq(nil)
        end
        it "Existe pagina de fin" do
            expect(@e1.pfin).to eq(nil)
            expect(@e2.pfin).not_to eq(nil)
            expect(@e3.pfin).not_to eq(nil)
        end
        it "Existe issn" do
            expect(@e1.issn).not_to eq(nil)
            expect(@e2.issn).not_to eq(nil)
            expect(@e3.issn).not_to eq(nil)
        end
        it "Existe numero de revista" do
            expect(@e1.url).not_to eq(nil)
            expect(@e2.url).not_to eq(nil)
            expect(@e3.url).not_to eq(nil)
        end
    end
    
    describe "Comprobacion de un correcto funcionamiento de los metodos de Libro" do
        it "Test metodo autor" do
            expect(@b1.autores).to eq(["Dave Thomas", "Andy Hunt", "Chad Fowler"])
            expect(@b2.autores).to eq(["Scott Chacon"])
            expect(@b3.autores).to eq(["David Flanagan", "Yukihiro Matsumoto"])
        end
        it "Test metodo titulo" do
            expect(@b1.titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide")
            expect(@b2.titulo).to eq("Pro Git 2009th Edition")
            expect(@b3.titulo).to eq("The Ruby Programming Language")
        end
        it "Test metodo serie" do
            expect(@b1.serie).to eq("The Facets of Ruby")
            expect(@b2.serie).to eq("Pro")
            expect(@b3.serie).to eq(nil)
        end
        it "Test metodo editorial" do
            expect(@b1.editorial).to eq("Pragmatic Bookshelf")
            expect(@b2.editorial).to eq("Apress")
            expect(@b3.editorial).to eq("O'Reilly Media")
        end
        it "Test metodo edicion" do
            expect(@b1.n_edicion).to eq(4)
            expect(@b2.n_edicion).to eq(2009)
            expect(@b3.n_edicion).to eq(1)
        end
        it "Test metodo fecha" do
            expect(@b1.fecha_publicacion.to_s).to eq("2013-07-07")
            expect(@b2.fecha_publicacion.to_s).to eq("2009-08-27")
            expect(@b3.fecha_publicacion.to_s).to eq("2008-02-04")
        end
        it "Test metodo isbn" do
            expect(@b1.isbn).to eq(["978-1937785499", "1937785491"])
            expect(@b2.isbn).to eq(["978-1430218333", "1430218339"])
            expect(@b3.isbn).to eq(["0596516177", "978-0596516178"])
        end
        it "Test metodo to_s (nos devuelve una referencia formateada)" do
            expect(@b1.to_s).to eq(@b1.to_s)
            expect(@b2.to_s).to eq(@b2.to_s)
            expect(@b3.to_s).to eq(@b3.to_s)
        end
    end
    
    describe "Lanzamiento de errores al construir Libro" do
      it "Debe haber un autor" do
          expect { Libro.new(nil, "titulo", "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber un titulo" do
          expect { Libro.new(["autor1"] , nil, "serie", "editorial", 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una editorial" do
          expect { Libro.new(["autor1","autor2","autor3"], "titulo", "serie",nil , 1, "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una edicion" do
          expect { Libro.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial",nil , "1-1-1991", ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
      it "Debe haber una fecha de publicacion" do
          expect { Libro.new(["autor1","autor2","autor3"], "titulo", "serie", "editorial", 1,nil , ["isbn1", "isbn2"]) }.to raise_error(ArgumentError)
      end
    end
    
    describe "Comprobacion de una correcta construccion de la lista" do
        it "Existe al menos un Nodo" do
            expect(@l1.front).not_to eq(nil)
            expect(@l2.front).not_to eq(nil)
        end
        it "Los nodos tienen un valor, un sucesor y un predecesor" do
            expect(@l1.front.value).to eq(nil)
            expect(@l1.front.next).to eq(nil)
            expect(@l1.front.previous).to eq(nil)
            expect(@l1.end.value).to eq(nil)
            expect(@l1.end.next).to eq(nil)
            expect(@l1.end.previous).to eq(nil)
            expect(@l2.front.value).not_to eq(nil)
            expect(@l2.front.next).to eq(nil)
            expect(@l2.front.previous).to eq(nil)
            expect(@l2.end.value).not_to eq(nil)
            expect(@l2.end.next).to eq(nil)
            expect(@l2.end.previous).to eq(nil)
        end
    end
    
    describe "Comprobacion del funcionamiento del enlace entre Nodos" do
        it "Test enlace nodos" do
            expect(@l1.front.value).to eq(nil)
            expect(@l2.front.value).to eq(@b1)
        end
    end
    
    describe "Comprobacion del funcionamiento de los metodos de la lista" do
        it "Se inserta un elemento al principo de la lista" do
            @l1.push_front(@b3)
            expect(@l1.front.value).to eq(@b3)
             @l2.push_front(@b3)
            expect(@l2.front.value).to eq(@b3)
        end
        it "Se inserta un elemento al final de la lista" do
            @l1.push_back(@b1)
            expect(@l1.get_pos(@l1.size-1).value).to eq(@b1)
            @l2.push_back(@b2)
            expect(@l2.get_pos(@l2.size-1).value).to eq(@b2)
        end
        it "Se extrae el primer elemento de la lista" do
            expect(@l1.pop_front).to eq(nil)
            expect(@l2.pop_front).to eq(@b1)
        end
        it "Se extrae el ultimo elemento de la lista" do
            expect(@l1.pop_back).to eq(nil)
            expect(@l2.pop_back).to eq(@b1)
        end
        it "Se inserta un elemento a la lista" do
            @l1.insert(0, @b1)
            expect(@l1.front.value).to eq(@b1)
        end
        it "Se insertan varios elementos a la lista" do
            @l1.insert(0, @b1)
            expect(@l1.front.value).to eq(@b1)
            @l1.insert(1, @b2)
            expect(@l1.get_pos(1).value).to eq(@b2)
            @l1.insert(2, @b3)
            expect(@l1.get_pos(2).value).to eq(@b3)
        end
    end
    
    describe "Comprobacion de las comparaciones" do
        it "Test mayor que" do
            expect(@b2 > @b1).to be true
            expect(@r2 > @r1).to be true
            expect(@p2 > @p1).to be true
            expect(@e2 > @e1).to be true
            expect(@p2 > @e1).to be true
        end
        it "Test mayor o igual que" do
            expect(@b2 >= @b1).to be true
            expect(@r2 >= @r1).to be true
            expect(@p1 >= @p1).to be true
            expect(@e1 >= @e1).to be true
            expect(@p2 >= @e1).to be true
        end
        it "Test menor que" do
            expect(@b1 < @b2).to be true
            expect(@r1 < @r2).to be true
            expect(@p1 < @p2).to be true
            expect(@e1 < @e2).to be true
            expect(@p1 < @e2).to be true
        end
        it "Test menor o igual que" do
            expect(@b1 <= @b2).to be true
            expect(@r1 <= @r2).to be true
            expect(@p1 <= @p1).to be true
            expect(@e1 <= @e1).to be true
            expect(@e1 <= @p2).to be true
        end
        it "Test igual que" do
            expect(@b1 == @b1).to be true
            expect(@r1 == @r1).to be true
            expect(@p1 == @p1).to be true
            expect(@e1 == @e1).to be true
            expect(@e1 == @p1).to be true
            expect(@r1 == @p1).to be true
            expect(@r1 == @e1).to be true
        end
        it "Test distinto que" do
            expect(@b1 != @b2).to be true
            expect(@r1 != @r2).to be true
            expect(@p1 != @p2).to be true
            expect(@e1 != @e2).to be true
            expect(@e1 != @p2).to be true
            expect(@p2 != @r1).to be true
            expect(@r2 != @e1).to be true
        end
    end
    
    describe "Comprobacion Enumerable" do
        it "comprobrando el metodo all? con un bloque vacio" do
            expect(@l1.all?).to eq(true)
            expect(@l2.all?).to eq(true)
        end
        it "comprobrando el metodo any?" do
            expect(@l1.any?).to eq(false)
            expect(@l2.any?).to eq(true)
        end
        it "comprobrando el metodo collect" do
            expect(@l1.map{|i| i}).to eq([])
            expect(@l2.map{|i| i}).to eq([@b1])
            expect(@l2.collect{|i| i}).to eq([@b1])
        end 
        it "comprobrando el metodo count" do
            expect(@l1.count).to eq(0)
            expect(@l2.count).to eq(1)
            expect(@l3.count).to eq(2)
        end
        it "comprobrando el metodo detect" do
            expect(@l3.detect {|i| i == @b3}).to eq(nil)
            expect(@l3.detect {|i| i == @p2}).to eq(@p2)
            expect(@l3.find {|i| i == @b3}).to eq(nil)
            expect(@l3.find {|i| i == @p1}).to eq(@p1)
        end
        it "comprobrando drop" do
            expect(@l3.drop(1)).to eq([@p1])
        end
        it "comprobrando max" do
            expect(@l3.max).to eq(@p2)
        end
        it "comprobrando min" do
            expect(@l3.min).to eq(@p1)
        end
        it "comprobrando sort" do
            expect(@l3.sort).to eq([@p1,@p2])
        end
    end
end