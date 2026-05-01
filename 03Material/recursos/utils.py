"""
utils.py — Funciones auxiliares reutilizables del curso

Cada notebook puede importar desde aquí para mantener consistencia y portabilidad.
Ej:
    sys.path.append(os.path.abspath('../../recursos'))
    from utils import load_data
"""

from pathlib import Path

import pandas as pd

# ============================================================
# Constantes globales del curso
# ============================================================

RANDOM_STATE = 42

# Ruta absoluta a la carpeta data/ del curso (relativa al script)
DATA_DIR = Path(__file__).parent.parent.parent / "data"


# ============================================================
# Funciones de carga
# ============================================================


def load_data(filename: str, **read_kwargs) -> pd.DataFrame:
    """
    Carga un dataset desde la carpeta data/ del curso.

    Parameters
    ----------
    filename : str
        Nombre del archivo (con extensión). Ej. 'ventas.csv'.
    **read_kwargs : dict
        Argumentos adicionales para pd.read_csv (ej. sep=';', encoding='latin1').

    Returns
    -------
    pd.DataFrame

    Examples
    --------
    >>> df = load_data('ventas.csv')
    >>> df = load_data('ventas.csv', sep=';', encoding='latin1')
    """
    path = DATA_DIR / filename
    if not path.exists():
        raise FileNotFoundError(
            f"No se encontró {filename} en {DATA_DIR}. "
            f"Verifica que el dataset esté en la carpeta data/."
        )

    if filename.endswith(".csv"):
        return pd.read_csv(path, **read_kwargs)
    elif filename.endswith(".xlsx") or filename.endswith(".xls"):
        return pd.read_excel(path, **read_kwargs)
    elif filename.endswith(".parquet"):
        return pd.read_parquet(path, **read_kwargs)
    else:
        raise ValueError(f"Extensión no soportada: {filename}")


# ============================================================
# Helpers pedagógicos
# ============================================================


def describe_dataset(df: pd.DataFrame) -> None:
    """
    Imprime un resumen pedagógico del dataset (filas, columnas, tipos, nulos).

    Útil al inicio de cada notebook para que el alumno tenga vista panorámica.
    """
    print(f"📊 Dataset: {df.shape[0]} filas × {df.shape[1]} columnas")
    print(f"\n🏷️  Tipos de columnas:")
    for col, dtype in df.dtypes.items():
        nulls = df[col].isnull().sum()
        null_pct = 100 * nulls / len(df)
        print(f"   {col:<30} {str(dtype):<15} ({nulls} nulos, {null_pct:.1f}%)")
