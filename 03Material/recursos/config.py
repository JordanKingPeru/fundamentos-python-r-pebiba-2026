"""
config.py — Configuraciones globales del curso

Importa estas constantes en cada notebook para mantener consistencia.
"""

# ============================================================
# Reproducibilidad
# ============================================================

RANDOM_STATE = 42

# ============================================================
# Visualización
# ============================================================

# Paleta UNI (de guia_branding.md)
UNI_PALETTE = {
    "crimson": "#8A1525",
    "slate": "#2C3E50",
    "paper": "#FAFAFA",
    "gray": "#E5E7EB",
    "emerald": "#10B981",
    "soft_red": "#EF4444",
    "amber": "#F59E0B",
    "neutral": "#6B7280",
}

# Tamaño por defecto de figuras
FIGSIZE_DEFAULT = (10, 6)
FIGSIZE_WIDE = (14, 5)
FIGSIZE_SQUARE = (8, 8)

# DPI para exports
DPI_PRESENTATION = 150
DPI_PRINT = 300

# ============================================================
# Pandas display
# ============================================================

PANDAS_MAX_ROWS = 30
PANDAS_MAX_COLS = 30
PANDAS_FLOAT_FORMAT = "{:.2f}"
