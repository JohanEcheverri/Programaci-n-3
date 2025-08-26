
defmodule Util do
  @moduledoc """
Módulo con funciones que se reutilizan
- autor: Johan Sebastian Echeverri Ibarra
- fecha: 19 Agosto 2025
- licencia: GNU GPL v3
"""

@doc """
Función para mostrar un mensaje en la pantalla con Java
## Parámetro
  - mensaje: texto que se le presenta al usuario
"""
  def mostrar_mensaje_Java(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end

  @doc """
Función para mostrar un mensaje
## Parámetro
  - mensaje: texto que se le presenta al usuario
"""
  def mostrar_mensaje(mensaje) do
    mensaje
    |>IO.puts()
  end

@doc """
Función para ingresar un String
## Parámetros
  - mensaje: texto que ingresa el usuario
"""
  def ingresar(mensaje, :texto) do
  mensaje
  |> IO.gets()
  |> String.trim()
  end

@doc """
Función para ingresar un String con Java
## Parámetro
  - mensaje: texto que ingresa el usuario
"""
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

@doc """
Función para ingresar un Integer
## Parámetro
  - mensaje: texto que ingresa el usuario
"""
  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
        |> String.to_integer()
  rescue
    ArgumentError ->
      "Error, se espera que ingrese un número entero\n"
      |> mostrar_error()

      mensaje
      |> ingresar(:entero)
    end
  end

@doc """
Función para ingresar un numero real
## Parámetro
  - mensaje: texto que ingresa el usuario
"""
  def ingresar(mensaje, :real) do
  try do
    mensaje
    |> ingresar(:texto)
    |> String.to_float()
  rescue
    ArgumentError ->
      "Error, se espera que ingrese un número real\n"
      |> mostrar_error()

      mensaje
      |> ingresar(:real)
    end
  end

@doc """
Función para ingresar mostrar un mensaje de error
## Parámetro
  - mensaje: texto que de error que le aparece al usuario
"""
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
