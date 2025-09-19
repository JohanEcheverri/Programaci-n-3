defmodule Cine do
  def reservar_sillas(inventario, sala_num, cantidad_solicitada) do
    if Map.has_key?(inventario, sala_num) do
      if Map.get(inventario, sala_num) < cantidad_solicitada do
        IO.puts("No hay suficientes sillas disponibles")
        inventario
      else
        IO.puts("Reserva exitosa")
        Map.put(inventario, sala_num, Map.get(inventario, sala_num) - cantidad_solicitada)
      end
    else
      IO.puts("Sala no encontrada")
      inventario
    end
  end

  def main do
    salas = %{
      1 => 10,
      2 => 5,
      3 => 0
    }

    sala = "Ingrese número de sala (1, 2, 3): "
      |> Util.ingresar(:entero)

    cant = "Ingrese cantidad de sillas a reservar: "
      |> Util.ingresar(:entero)

    salas = reservar_sillas(salas, sala, cant)

    IO.puts("Estado de salas actualizado:")
    IO.inspect(salas)
  end
end
Cine.main()
