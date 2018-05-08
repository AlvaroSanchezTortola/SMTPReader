#!/usr/bin/ruby -w
=begin
@AlvaroSanchez
Lado logico de calculadora, apoyado en el modulo Arithmetics para 
el manejo de la aritmetica. 
=end
$LOAD_PATH << '.'
require "math"

class Calculator
	include Arithmetics;
	attr_accessor :memory, :actual, :respuesta
	def initialize
		@actual = ""
		@memory = ""
		@respuesta = "vacio"
		@operacion = ""
	end
	def boton0
		@actual = @actual + "0"
	end
	def boton1
		@actual = @actual + "1"
	end
	def boton2
		@actual = @actual + "2"
	end
	def boton3
		@actual = @actual + "3"
	end
	def boton4
		@actual = @actual + "4"
	end
	def boton5
		@actual = @actual + "5"
	end
	def boton6
		@actual = @actual + "6"
	end
	def boton7
		@actual = @actual + "7"
	end
	def boton8
		@actual = @actual + "8"
	end
	def boton9
		@actual = @actual + "9"
	end
	def botonSum
        @memory = @actual
        @actual = ""
        @operacion = "suma"
	end
	def botonSus
        @memory = @actual
        @actual = ""
        @operacion = "resta"
	end
	def botonMul
        @memory = @actual
        @actual = ""
        @operacion = "mul"
	end
	def botonDiv
        @memory = @actual
        @actual = ""
        @operacion = "div"
	end
	def botonEqual
		case @operacion
		when "suma"
			@respuesta = sum(@memory.to_f, @actual.to_f).to_s
		when "resta"
			@respuesta = substract(@memory.to_f, @actual.to_f).to_s
		when "mul"
			@respuesta = multiply(@memory.to_f, @actual.to_f).to_s
		when "div"
			@respuesta = divide(@memory.to_f, @actual.to_f).to_s
		end
	end
	def botonClear
		@actual = ""
	end
	def botonClearAll
		@actual = ""
		@memory = ""
		@respuesta = ""
		@operacion = ""
	end
	def botonMemPlus
		@respuesta = sum(@memory.to_f, @actual.to_f).to_s
	end
	def botonMemMinus
		@respuesta = substract(@memory.to_f, @actual.to_f).to_s
	end
	def botonMemRec
		@respuesta = @memory
	end
	def botonMemClear
		@memory = ""
	end
end
=begin
calc = Calculator.new
calc.boton5
calc.botonMul
calc.boton9
calc.botonEqual
puts calc.respuesta
calc.botonMemRec
puts calc.respuesta
calc.botonClearAll
calc.boton9
calc.botonDiv
calc.boton2
calc.botonEqual
puts calc.respuesta
=end