import os
import numpy as np
import matplotlib.pyplot as plt
import json

def parse_engineering_notation(value_str):
    """Parse a string with engineering notation (e.g., '1.2k', '3.3m') into a float."""
    multipliers = {
        'p': 1e-12,
        'n': 1e-9,
        'u': 1e-6,
        'm': 1e-3,
        'k': 1e3,
        'meg': 1e6,
        'g': 1e9,
        't': 1e12
    }
    value_str = value_str.strip().lower()
    for suffix, multiplier in multipliers.items():
        if value_str.endswith(suffix):
            try:
                return float(value_str[:-len(suffix)]) * multiplier
            except ValueError:
                raise ValueError(f"Invalid number format: {value_str}")
    try:
        return float(value_str)
    except ValueError:
        raise ValueError(f"Invalid number format: {value_str}")

def treat_results(data_path, parameters):
    #load data from file. Format: (vdiff1, vout_p, vdiff1, vout_n, vdiff1, isrc)
    if not os.path.exists(data_path):
        print(f"[AK] Error: Data file {data_path} does not exist.")
        return
    data = np.loadtxt(data_path)
    if data.ndim == 1:
        data = data.reshape(1, -1)
    if data.shape[1] < 6:
        print(f"[AK] Error: Data file {data_path} must have at least 6 columns (vdiff1, vout_p, vdiff1, vout_n, vdiff1, isrc).")
        return
    print(f"[AK] Loaded data from {data_path}, shape: {data.shape}")
    vdiff1 = data[:, 0]
    vout_p = data[:, 1]
    vout_n = data[:, 3]
    isrc = data[:, 5]
    #calculate gain as average of vout_diff / vdiff1 for non-zero vdiff
    print(f"[AK] Calculating gain...")
    vout_diff = vout_p - vout_n
    non_zero_indices = np.where(np.abs(vdiff1) > 1e-6)
    if len(non_zero_indices[0]) == 0:
        print(f"[AK] Warning: No non-zero vdiff1 values found for gain calculation.")
        return [0.0]
    gains = vout_diff[non_zero_indices] / vdiff1[non_zero_indices]
    gain = np.mean(gains)
    print(f"[AK] Calculated gain: {gain}")
    return [gain]
    

def plot(results):
    for condition, case_results, output_file in results:
        print(f"Condition: {condition}, Results: {case_results}, Data file: {output_file}")
        png_path = os.path.splitext(output_file)[0] + ".png"
        #plot vout_p and vout_n vs vdiff1
        data = np.loadtxt(output_file)
        if data.ndim == 1:
            data = data.reshape(1, -1)
        vdiff1 = data[:, 0]
        vout_p = data[:, 1]
        vout_n = data[:, 3]
        plt.figure()
        plt.plot(vdiff1, vout_p, label='Vout+')
        plt.plot(vdiff1, vout_n, label='Vout-')
        plt.xlabel('Vdiff1 (V)')
        plt.ylabel('Output Voltage (V)')
        plt.title(f"Output Voltages vs Vdiff1")
        plt.legend()
        plt.grid(True)
        plt.savefig(png_path)
        plt.close()
        print(f"[AK] Saved plot to {png_path}")
