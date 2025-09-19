defmodule Password do
  def validar(contrasena) do
    errores = []
    |> validar_longitud(contrasena)
    |> validar_mayuscula(contrasena)
    |> validar_numero(contrasena)
    |> validar_espacios(contrasena)

    if errores == [] do
      {:ok, "Contraseña segura"}
    else
      {:error, Enum.join(errores, " | ")}
    end
  end

  defp validar_longitud(errores, contrasena) do
    if String.length(contrasena) < 8 do
      errores ++ ["Debe tener al menos 8 caracteres"]
    else
      errores
    end
  end

  defp validar_mayuscula(errores, contrasena) do
    if String.downcase(contrasena) == contrasena do
      errores ++ ["Debe contener al menos una letra mayúscula"]
    else
      errores
    end
  end

  defp validar_numero(errores, contrasena) do
    if String.match?(contrasena, ~r/\d/) do
      errores
    else
      errores ++ ["Debe contener al menos un número"]
    end
  end

  defp validar_espacios(errores, contrasena) do
    if String.contains?(contrasena, " ") do
      errores ++ ["No debe contener espacios"]
    else
      errores
    end
  end


  def main do
    contrasena = "Ingrese una contraseña: "
      |> Util.ingresar(:texto)
      |> String.trim()

    case validar(contrasena) do
      {:ok, mensaje} ->
        IO.puts(mensaje)

      {:error, mensaje} ->
        IO.puts("Errores encontrados: #{mensaje}")
    end
  end
end

Password.main()
