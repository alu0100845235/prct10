# encoding: utf-8
#require "./node.rb"
# create a Struct with :value and :next


class List
    include Enumerable
    attr_reader :front, :end, :size
    
    def initialize(value = nil)
        @size = 0
        @front = Node.new(nil, nil, nil)
        @end = @front
        
        if value != nil
            push_front(value)
        end
    end
    
    def push_back(value)
        if size == 0
            @end = Node.new(value, nil, nil)
            @front = @end
        else
            @end.next = Node.new(value, @end, nil)
            @end = @end.next
        end
        @size = @size + 1
        nil
    end
    
    def push_front(value)
        if size == 0
            @front = Node.new(value, nil, nil)
            @end = @front
        else
            @front.previous = Node.new(value, nil, @front)
            @front= @front.previous
        end
        @size = @size + 1
        nil
    end
    
    def pop_back
        aux = nil
        if size == 1
            aux = @end.value
            @end = Node.new(nil, nil, nil)
            @front = @end
            @size = @size - 1
        elsif size > 1
            aux = @end.value
            @end = @end.previous
            @size = @size - 1
        end
        aux
    end

    def pop_front
        aux = nil
        if size == 1
            aux = @front.value
            @front = Node.new(nil, nil, nil)
            @end = @front
            @size = @size - 1
        elsif size > 1
            aux = @front.value
            @front = @front.next
            @size = @size - 1
        end
        aux
    end
    
    def insert(position, value)
        if position >= 0 && position <= @size
            
            if position == 0 && @size == 0      # La lista esta vacia
                push_front(value)
            elsif position == @size
                push_back(value)
            elsif position  == 0
                push_front(value)
            else
                # Buscamos el nodo anterior a la posicion
                i = 0
                aux = @front
                while i < position-1
                    aux = aux.next
                    i = i+1
                end
                
                #realizamos swap
                swap = aux.next
                aux.next = Node.new(value, aux, swap)
                aux = aux.next
                @size = @size + 1
            end
        end    
        nil
    end
    
    def get_pos(position)
        if position < @size
            aux = @front
            if position > 0
                i = 0
                while i < position
                    aux = aux.next
                    i = i+1
                end
            end
        else
            aux = nil
        end
        aux
    end
    
    def printing
        if @front.value != nil
            aux = @front
            puts @front.value
            while aux.next != nil
                aux = aux.next
                puts aux.value.to_s
            end
        end
    end
    
    def each
        return nil unless @size > 0
        aux = @front
        until aux.nil?
            yield aux.value
            aux = aux.next
        end
    end
    
    def clear
        @size = 0
        @front = Node.new(nil, nil, nil)
        @end = @front
    end
    
end
