defmodule CalcularConsumo do
  def main do
    nombre_conductor = "Ingresar nombre del conductor: "
    |> Util.ingresar(:texto)

    distancia_recorrida = "Ingresar distancia recorrida(Km): "
    |> Util.ingresar(:real)

    combustible_consumido = "Ingresar cantidad de combustible consumido(L): "
    |> Util.ingresar(:real)

    rendimiento = calcular_rendimiento(distancia_recorrida, combustible_consumido)


    mensaje = " #{nombre_conductor} su vehiculo recorre #{Float.round(rendimiento,2)} Kilometro por litro de gasolina"
    |> Util.mostrar_mensaje

  end

  def calcular_rendimiento(distancia_recorrida, combustible_consumido) do
    rendimiento = distancia_recorrida/combustible_consumido
  end

end

CalcularConsumo.main()
