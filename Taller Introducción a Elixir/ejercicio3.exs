defmodule ConversionTemperatura do
  def main do
    nombre_usuario = "Ingrese su nombre: "
    |> Util.ingresar(:texto)

    temperatura_celsius = "Ingresar Temperatura(°C): "
    |> Util.ingresar(:real)

    temperatura_fahrenheit = convertir_fahrenheit(temperatura_celsius)

    temperatura_kelvin = convertir_kelvin(temperatura_celsius)

    mensaje = " #{nombre_usuario} la temperatura es
    - #{temperatura_fahrenheit} °F
    - #{temperatura_kelvin} K"
    |> Util.mostrar_mensaje()



  end

  def convertir_fahrenheit(temperatura_celsius) do
    temperatura_fahrenheit =(temperatura_celsius * 9/5) +32
  end

  def convertir_kelvin(temperatura_celsius) do
    temperatura_kelvin = temperatura_celsius + 273.15
  end

end

ConversionTemperatura.main()
