defmodule  RegistarVehiculoPeaje do
  def main do
    placa_vehiculo = "Ingrese la placa del vehiculo: "
    |> Util.ingresar(:texto)

    tipo_vehiculo = "Ingrese el tipo de vehiculo (Automovil, Moto, Camion): "
    |> Util.ingresar(:texto)

   peso_vehiculo = "ingrese el peso del vehiculo (Toneladas): "
    |> Util.ingresar(:real)

    tarifa = calcular_tarifa(tipo_vehiculo, peso_vehiculo)

    mensaje = "El vehiculo de tipo #{tipo_vehiculo} con placa #{placa_vehiculo} que pesa #{peso_vehiculo}Tn debe pagar una tarifa de #{tarifa}"
    |> Util.mostrar_mensaje()

    {placa_vehiculo, tipo_vehiculo, tarifa}
  end

  def calcular_tarifa(tipo_vehiculo, peso_vehiculo) do
    tarifa = cond do
      tipo_vehiculo == "Carro" -> 10000
      tipo_vehiculo == "Moto" -> 5000
      tipo_vehiculo == "Camion" -> 20000 + (2000 * peso_vehiculo)
      true -> 0
    end
    tarifa
  end
end

RegistarVehiculoPeaje.main()
