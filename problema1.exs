defmodule Mensaje do
  @moduledoc """
Módulo que muestra un mensaje determinado
- autor: Johan Sebastian Echeverri Ibarra
- fecha: 19 Agosto 2025
- licencia: GNU GPL v3
"""
  def main do
    "Bienvenido a la empresa Once Ltda"
    |> Util.mostrar_mensaje()
  end
end
Mensaje.main
