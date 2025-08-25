defmodule Util do
  @moduledoc """
Módulo con funciones que se reutilizan
- autor: Johan Sebastian Echeverri Ibarra
- fecha: 19 Agosto 2025
- licencia: GNU GPL v3
"""

@doc """
Función para mostrar un mensaje en la pantalla.
## Parámetro
  - mensaje: texto que se le presenta al usuario
## Ejemplo
    iex> Util.mostrar_mensaje("Hola Mundo")
"""
  def mostrar_mensaje_Java(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end

  def mostrar_mensaje(mensaje) do
    mensaje
    |>IO.puts()
  end

  def ingresar(mensaje, :texto) do
  mensaje
  |> IO.gets()
  |> String.trim()
  end

  def ingresar_Java(mensaje,:texto) do
  # Llama al programa Java para ingresar texto y capturar la entrada
    case System.cmd("java", ["-cp", ".", "Mensaje","input", mensaje]) do
      {output, 0} ->
        IO.puts("Texto ingresado correctamente.")
        IO.puts("Entrada: #{output}")
        String.trim(output) # Retorna la entrada sin espacios extra
      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
      nil #!null
    end
  end
end
