defmodule CostoEnvioPaquete do
  def main do
    nombre_cliente = "Ingrese el nombre del cliente: "
    |> Util.ingresar(:texto)

    peso_paquete = "Ingrese el peso del paquete (Kg): "
    |> Util.ingresar(:real)

    tipo_envio = seleccionar_tipo_envio()

    costo_envio = calcular_costo_envio(peso_paquete, tipo_envio)

    mensaje = Util.mostrar_mensaje("El cliente #{nombre_cliente} debe pagar un costo de envío de #{costo_envio} por un paquete de #{peso_paquete}Kg con envío #{tipo_envio}.")
    {nombre_cliente, peso_paquete, tipo_envio, costo_envio}
  end

  def seleccionar_tipo_envio do
    IO.puts("Seleccione el tipo de envío:")
    IO.puts("1. Económico")
    IO.puts("2. Express")
    IO.puts("3. Internacional")
    opcion = IO.gets("Ingrese el número de la opción: ")
    |> String.trim()
    |> String.to_integer()

    case opcion do
      1 -> "Económico"
      2 -> "Express"
      3 -> "Internacional"
      _ -> IO.puts("Opción inválida, por favor intente de nuevo.")
           seleccionar_tipo_envio()
    end
  end

  def calcular_costo_envio(peso_paquete, tipo_envio) do
    costo = cond do
      tipo_envio == "Económico" -> peso_paquete * 5000
      tipo_envio == "Express" -> peso_paquete * 8000
      tipo_envio == "Internacional" ->
        if peso_paquete <= 5 do
          15000 * peso_paquete
        else
          20000 * peso_paquete
        end
      true -> 0
    end
    costo
  end
end
CostoEnvioPaquete.main()
