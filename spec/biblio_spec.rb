require 'spec_helper'

describe Biblio do
  before :each do
        @b1 = Libro.new(["Dave Thomas", "Andy Hunt", "Chad Fowler"], "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide", "The Facets of Ruby", "Pragmatic Bookshelf", 4, "07/07/2013", ["978-1937785499", "1937785491"])
        @b2 = Libro.new(["Scott Chacon"], "Pro Git 2009th Edition", "Pro", "Apress" , 2009, "27/08/2009", ["978- 1430218333", "1430218339"])
        @b3 = Libro.new(["David Flanagan", "Yukihiro Matsumoto"], "The Ruby Programming Language", nil, "O’Reilly Media", 1, "04/02/2008", ["0596516177", "978-0596516178"])
        @b4 = Libro.new(["David Chelimsky", "Dave Astels", "Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Helleson"], "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends", "The Facets of Ruby", "Pragmatic Bookshelf", 1, "25/12/2010", ["1934356379", "978-1934356371"])
        @b5 = Libro.new(["Richard E"], "Silverman Git Pocket Guide", nil, "O’Reilly Media", 1, "02/08/2013", ["1449325866", "978-1449325862"])
        
        @l1 = List.new
        @l2 = List.new(@b1)
        
        @p1 = Periodico.new(["autor"], "Titulo", "Periodico", "07/07/2013", 1, nil, "123456789")
        @p2 = Periodico.new(["autor1", "autor2"], "Titulo2", "Periodico2", "08/08/2013", 1, 2, "123456789")
        @p3 = Periodico.new(["autor"], "Titulo3", "Periodico3", "08/08/2013", 1, 100, "123456789")
        
        @r1 = Revista.new(["autor"], "Titulo", "Revista", "07/07/2013", 10, 1, nil, "123456789")
        @r2 = Revista.new(["autor1", "autor2"], "Titulo2", "Revista2", "08/08/2013", 11, 1, 2, "123456789")
        @r3 = Revista.new(["autor"], "Titulo3", "Revista3", "08/08/2013", 12, 1, 100, "123456789")
        
        @e1 = Edocumento.new(["autor"], "Titulo", "Revista", "07/07/2013", 1, nil, "123456789", "http://www.hola.com")
        @e2 = Edocumento.new(["autor1", "autor2"], "Titulo2", "Revista2", "08/08/2013", 1, 2, "123456789", "http://www.hastaluego.com")
        @e3 = Edocumento.new(["autor"], "Titulo3", "Revista3", "08/08/2013", 1, 100, "123456789", "http://www.chao.com")
    end
    
    describe "Comprobación de la herencia de Libro" do
        it "Test herencicia lista" do
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
    
    describe "Comprobación de una correcta construcción de Libro" do
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
    
    describe "Comprobación de un correcto funcionamiento de los métodos de Libro" do
        it "Test método autor" do
            expect(@b1.autores).to eq(["Dave Thomas", "Andy Hunt", "Chad Fowler"])
            expect(@b2.autores).to eq(["Scott Chacon"])
            expect(@b3.autores).to eq(["David Flanagan", "Yukihiro Matsumoto"])
        end
        it "Test método titulo" do
            expect(@b1.titulo).to eq("Programming Ruby 1.9 & 2.0: The Pragmatic Programmers Guide")
            expect(@b2.titulo).to eq("Pro Git 2009th Edition")
            expect(@b3.titulo).to eq("The Ruby Programming Language")
        end
        it "Test método serie" do
            expect(@b1.serie).to eq("The Facets of Ruby")
            expect(@b2.serie).to eq("Pro")
            expect(@b3.serie).to eq(nil)
        end
        it "Test método editorial" do
            expect(@b1.editorial).to eq("Pragmatic Bookshelf")
            expect(@b2.editorial).to eq("Apress")
            expect(@b3.editorial).to eq("O’Reilly Media")
        end
        it "Test método edicion" do
            expect(@b1.n_edicion).to eq(4)
            expect(@b2.n_edicion).to eq(2009)
            expect(@b3.n_edicion).to eq(1)
        end
        it "Test método fecha" do
            expect(@b1.fecha_publicacion.to_s).to eq("2013-07-07")
            expect(@b2.fecha_publicacion.to_s).to eq("2009-08-27")
            expect(@b3.fecha_publicacion.to_s).to eq("2008-02-04")
        end
        it "Test método isbn" do
            expect(@b1.isbn).to eq(["978-1937785499", "1937785491"])
            expect(@b2.isbn).to eq(["978- 1430218333", "1430218339"])
            expect(@b3.isbn).to eq(["0596516177", "978-0596516178"])
        end
        it "Test método to_s (nos devuelve una referencia formateada)" do
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
    
    describe "Comprobación de la herencia de Periodico" do
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
    
    describe "Comprobación de la herencia de Revista" do
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
    
    describe "Comprobación de la herencia de Documento Electronico" do
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
    
    describe "Comprobación de la herencia de la lista" do
        it "Test herencia lista" do
            expect(@l1.is_a?Object).to be true
            expect(@l1.instance_of?List).to be true
            expect(@l2.is_a?Object).to be true
            expect(@l2.instance_of?List).to be true
        end
    end
    
    describe "Comprobación de una correcta construcción de la lista" do
        it "Existe al menos un Nodo" do
            expect(@l1.front).not_to eq(nil)
            expect(@l2.front).not_to eq(nil)
        end
        it "Los nodos tienen un valor y un sucesor" do
            expect(@l1.front.value).to eq(nil)
            expect(@l1.front.next).to eq(nil)
            expect(@l2.front.value).not_to eq(nil)
            expect(@l2.front.next).to eq(nil)
        end
    end
    
    describe "Comprobación del funcionamiento del enlace entre Nodos" do
        it "Test enlace nodos" do
            expect(@l1.front.value).to eq(nil)
            expect(@l2.front.value).to eq(@b1)
        end
    end
    
    describe "Comprobación del funcionamiento de los metodos de la lista" do
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
end
