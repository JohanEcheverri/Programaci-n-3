defmodule Envio do
  def tarifa_base(peso) when peso > 0 do
    cond do
      peso <= 1 -> 8000
      peso <= 5 -> 12000
      true -> 20000
    end
  end

  def descuento(:corporativo), do: 0.15
  def descuento(:estudiante), do: 0.10
  def descuento(:regular), do: 0.0

  def recargo(:express), do: 0.25
  def recargo(:estandar), do: 0.0

  def calcular(peso, cliente, servicio) when peso > 0 do
    base = tarifa_base(peso)
    desc = base * descuento(cliente)
    subtotal = base - desc
    rec = subtotal * recargo(servicio)
    total = subtotal + rec

    %{
      base: base,
      descuento: desc,
      subtotal: subtotal,
      recargo: rec,
      total: total
    }
  end

  def main do
    peso = "Ingrese el peso del paquete (kg): "
    |> Util.ingresar(:real)

    cliente = "Tipo cliente (1=corporativo, 2=estudiante, 3=regular): "
      |> Util.ingresar(:entero)
      |> case do
        1 -> :corporativo
        2 -> :estudiante
        3 -> :regular
      end

    servicio = "Tipo servicio (1=express, 2=estandar): "
      |> Util.ingresar(:entero)
      |> case do
        1 -> :express
        2 -> :estandar
      end

    resultado = calcular(peso, cliente, servicio)

    IO.puts("Factura de Envío:")
    IO.inspect(resultado)
  end
end
Envio.main()
