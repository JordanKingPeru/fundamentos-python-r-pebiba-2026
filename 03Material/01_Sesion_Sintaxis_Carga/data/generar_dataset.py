"""
generar_dataset.py — Generador del dataset sintético acme_ventas.csv

Crea 5,000 filas × 12 columnas con patrones realistas y "trampas" pedagógicas
intencionalmente incluidas (nulos en notas, registros de prueba con cantidad 9999).

Uso:
    python generar_dataset.py

Genera: acme_ventas.csv en la misma carpeta.
"""

from pathlib import Path

import numpy as np
import pandas as pd

RANDOM_STATE = 42
N_FILAS = 5000

OUT_PATH = Path(__file__).parent / "acme_ventas.csv"


def generar() -> pd.DataFrame:
    """Genera el dataset sintético."""
    rng = np.random.default_rng(RANDOM_STATE)

    # Catálogos
    regiones = ["Lima", "Arequipa", "Cusco", "Trujillo", "Piura", "Chiclayo"]
    quarters = ["Q1", "Q2", "Q3", "Q4"]
    productos = [
        "Laptop Pro 15",
        "Laptop Air 13",
        "Monitor 27 4K",
        "Teclado Mecánico",
        "Mouse Inalámbrico",
        "Silla Ergonómica",
        "Escritorio Ajustable",
        "Lámpara LED",
        "Resma Papel A4",
        "Cartucho Tinta Negra",
        "Auriculares BT",
        "Webcam HD",
    ]
    categoria_de = {
        "Laptop Pro 15": "Tecnología",
        "Laptop Air 13": "Tecnología",
        "Monitor 27 4K": "Tecnología",
        "Teclado Mecánico": "Tecnología",
        "Mouse Inalámbrico": "Tecnología",
        "Silla Ergonómica": "Mobiliario",
        "Escritorio Ajustable": "Mobiliario",
        "Lámpara LED": "Mobiliario",
        "Resma Papel A4": "Suministros",
        "Cartucho Tinta Negra": "Suministros",
        "Auriculares BT": "Electrónica",
        "Webcam HD": "Electrónica",
    }
    precio_base_de = {
        "Laptop Pro 15": 4500,
        "Laptop Air 13": 3200,
        "Monitor 27 4K": 1800,
        "Teclado Mecánico": 350,
        "Mouse Inalámbrico": 120,
        "Silla Ergonómica": 850,
        "Escritorio Ajustable": 1200,
        "Lámpara LED": 95,
        "Resma Papel A4": 28,
        "Cartucho Tinta Negra": 75,
        "Auriculares BT": 220,
        "Webcam HD": 180,
    }
    vendedores = [
        "Ana Torres",
        "Carlos Vega",
        "María Fernández",
        "José Luis Quispe",
        "Lucía Romero",
        "Diego Salazar",
    ]
    notas_pool = [
        "Cliente recurrente",
        "Compra urgente",
        "Solicita factura electrónica",
        "Pedido grande, descuento aplicado",
        "Primera compra",
        "Devolución parcial Q anterior",
        "Cliente premium",
    ]

    # Fechas distribuidas en 2026
    fechas = pd.date_range("2026-01-01", "2026-12-31", freq="D")
    fechas_muestra = rng.choice(fechas, size=N_FILAS)

    productos_muestra = rng.choice(productos, size=N_FILAS)

    df = pd.DataFrame({
        "id_transaccion": [f"TX-{i:06d}" for i in range(1, N_FILAS + 1)],
        "fecha": fechas_muestra,
        "quarter": pd.PeriodIndex(fechas_muestra, freq="Q").strftime("Q%q"),
        "region": rng.choice(regiones, size=N_FILAS),
        "producto": productos_muestra,
        "categoria": [categoria_de[p] for p in productos_muestra],
        "cantidad": rng.integers(1, 50, size=N_FILAS),
        "precio_unit": [
            round(precio_base_de[p] * rng.uniform(0.95, 1.05), 2)
            for p in productos_muestra
        ],
        "descuento_pct": np.round(rng.choice([0.0, 0.05, 0.10, 0.15, 0.20], size=N_FILAS), 2),
        "cliente_id": [f"CL-{rng.integers(1000, 9999)}" for _ in range(N_FILAS)],
        "vendedor": rng.choice(vendedores, size=N_FILAS),
        "notas": [
            rng.choice(notas_pool) if rng.random() > 0.3 else None
            for _ in range(N_FILAS)
        ],
    })

    # Trampas pedagógicas intencionales
    # 1) ~5 registros de prueba con cantidad 9999 (debe detectarse como outlier)
    indices_test = rng.choice(N_FILAS, size=5, replace=False)
    df.loc[indices_test, "cantidad"] = 9999

    return df


if __name__ == "__main__":
    df = generar()
    df.to_csv(OUT_PATH, index=False, encoding="utf-8")
    # Sin emojis en stdout para evitar UnicodeEncodeError en consola cp1252 de Windows
    print(f"OK: dataset generado en {OUT_PATH}")
    print(f"    Filas: {len(df):,}  Columnas: {df.shape[1]}")
    print(f"    Tamano en disco: {OUT_PATH.stat().st_size / 1024:.1f} KB")
