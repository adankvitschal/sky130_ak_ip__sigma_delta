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
    #load data from file: consists of columns: time, clk, out+, out-, Isrc
    if not os.path.exists(data_path):
        print(f"[AK] Error: Data file {data_path} does not exist.")
        return
    data = np.loadtxt(data_path)
    if data.ndim == 1:
        data = data.reshape(1, -1)
    if data.shape[1] < 4:
        print(f"[AK] Error: Data file {data_path} must have at least 4 columns (time, clk, out+, out-).")
        return
    print(f"[AK] Loaded data from {data_path}, shape: {data.shape}")
    t = data[:, 0] * 1E9  # Convert to ns
    clk = data[:, 1]
    out_p = data[:, 3]
    out_n = data[:, 5]
    ivdd = data[:, 7]
    #calculate propagation delay from clk to out+ and out-, consider 10%/90% of vdd 
    #clock signal contains a single pulse
    print(f"[AK] Calculating propagation delay and energy...")
    vdd = float(parameters["vdd"])
    thresh_low = 0.1 * vdd
    thresh_high = 0.9 * vdd
    print(f"[AK] VDD: {vdd}V, Thresh low: {thresh_low}V, Thresh high: {thresh_high}V")
    def find_crossing_time(signal, threshold, rising=True):
        if rising:
            indices = np.where((signal[:-1] < threshold) & (signal[1:] >= threshold))[0]
        else:
            indices = np.where((signal[:-1] > threshold) & (signal[1:] <= threshold))[0]
        if len(indices) == 0:
            return None
        idx = indices[0]
        # Linear interpolation to find more accurate crossing time
        t_cross = t[idx] + (t[idx + 1] - t[idx]) * (threshold - signal[idx]) / (signal[idx + 1] - signal[idx])
        return t_cross

    energy = np.trapz(ivdd * vdd, t * 1E-9)  # Energy in femtoJoules
    print(f"[AK] Calculated energy: {energy} J")

    vdiff = parse_engineering_notation(parameters.get("vdiff", "0"))
    if vdiff > 0:
        out_p_crossing = find_crossing_time(out_p, thresh_high, rising=True)
        out_n_crossing = find_crossing_time(out_n, thresh_low, rising=False)
    else:
        out_p_crossing = find_crossing_time(out_p, thresh_low, rising=False)
        out_n_crossing = find_crossing_time(out_n, thresh_high, rising=True)
    # Find rising edge crossing for clk and out+
    clk_crossing_rising = find_crossing_time(clk, thresh_low, rising=True)
    clk_crossing_falling = find_crossing_time(clk, thresh_high, rising=False)
    print(f"[AK] clk rising crossing at {clk_crossing_rising} ns, falling crossing at {clk_crossing_falling} ns")
    out_p_delay = out_p_crossing - clk_crossing_rising if out_p_crossing is not None and clk_crossing_rising is not None else None
    out_n_delay = out_n_crossing - clk_crossing_rising if out_n_crossing is not None and clk_crossing_rising is not None else None
    print(f"[AK] out+ crossing at {out_p_crossing} ns, delay {out_p_delay*1E3} ps")
    print(f"[AK] out- crossing at {out_n_crossing} ns, delay {out_n_delay*1E3} ps")
    #return results as a dict
    return [energy*1E15, out_p_delay*1E3, out_n_delay*1E3] # Energy in fJ, delays in ps

def plot(results):
    for condition, case_results, output_file in results:
        print(f"Condition: {condition}, Results: {case_results}, Data file: {output_file}")
        png_path = os.path.splitext(output_file)[0] + ".png"
        # Prepare description for plot
        vdiff = condition.get("vdiff", None)
        vcm = condition.get("vcm", None)
        desc = "netlist_name"
        if vdiff is not None or vcm is not None:
            desc += " ("
            if vdiff is not None:
                desc += f"Vdiff={vdiff}"
            if vcm is not None:
                if vdiff is not None:
                    desc += ", "
                desc += f"Vcm={vcm}"
            desc += ")"

        if os.path.exists(output_file):
            try:
                data = np.loadtxt(output_file)
                if data.ndim == 1:
                    data = data.reshape(1, -1)
                if data.shape[1] < 8:
                    raise ValueError(f"Data file {output_file} must have at least 4 pairs of columns (time vs clock, time vs out+, time vs out-, time vs Isrc).")
                t = data[:, 0] * 1E9  # Convert to ns
                clk = data[:, 1]
                out_p = data[:, 3]
                out_n = data[:, 5]
                isrc = data[:, 7]

                fig, axs = plt.subplots(3, 1, figsize=(10, 8), sharex=True)
                axs[0].plot(t, clk, label="Clock", color='tab:blue')
                axs[0].set_ylabel("Clock")
                axs[0].legend()
                axs[0].grid(True)

                axs[1].plot(t, out_p, label="Output +", color='tab:green')
                axs[1].plot(t, out_n, label="Output -", color='tab:red')
                axs[1].set_ylabel("Output (V)")
                axs[1].legend()
                axs[1].grid(True)

                # Convert current to uA for better readability
                axs[2].plot(t, -isrc * 1e6, label="Source Current", color='tab:purple')
                axs[2].set_ylabel("I_src (μA)")
                axs[2].legend()
                axs[2].grid(True)

                axs[-1].set_xlabel("Time (ns)")
                plt.suptitle(desc)
                plt.tight_layout(rect=[0, 0.03, 1, 0.95])
                plt.savefig(png_path)
                plt.close()
                print(f"[AK] Saved plot to {png_path}")
            except Exception as e:
                print(f"[AK] Error plotting data from {output_file}: {e}")
        else:
            print(f"[AK] Data file {output_file} not found, skipping plot.")