import os
import subprocess
import re
import json
import sys
import itertools

def load_config(config_path):
    with open(config_path, "r") as f:
        config = json.load(f)
    default_parameters = config["defaults"]
    variants = config["variants"]
    tb_dir = config["dir"]["testbench"]
    sim_dir = config["dir"]["simulation"]
    for variant in variants:
        variant_tests_folder =  '{}/{}/tests'.format(sim_dir,variant["description"])
        print('Variant folder: {}'.format(variant_tests_folder))
        for test_name in config["tests"]:
            #print('Running testbench {} for variant {}'.format(test["testbench"], variant["description"]))
            test = config["tests"][test_name]
            tb_path = os.path.join(tb_dir, test["testbench"])
            test_folder = '{}/{}'.format(variant_tests_folder, test_name)
            results_path = os.path.join(test_folder, "results.csv")
            if not os.path.exists(test_folder):
                os.makedirs(test_folder)
            #prepare results file with header
            with open(results_path, "w") as f:
                result_format = test["outputs"]
                # Write each condition key as a column header
                for cond_key in test["conditions"].keys():
                    f.write(f"{cond_key},")
                for column in result_format:
                    f.write(f"{column['description']} ({column['unit']}),")
                f.write("\n")
            conditions = generate_condition_groups(test["conditions"])
            results = []
            condition_index = 0
            for condition in conditions:
                #condition_str = '_'.join(f'{k}{v}' for k, v in condition.items())
                case_folder = '{}/case{:03d}'.format(test_folder, condition_index)
                print('Condition: {}'.format(case_folder))
                if not os.path.exists(case_folder):
                    os.makedirs(case_folder)
                generate_netlist(tb_path, case_folder)
                #merge default, variant and test conditions in a single parameters dict, write conditions is a json file inside case_folder
                combined_parameters = {**default_parameters, **variant.get("parameters", {}), **condition}
                #substitute "output_file" parameter in netlist with path to output file inside case_folder
                output_file = os.path.join(case_folder, "output.data")
                combined_parameters["output_file"] = output_file
                with open(os.path.join(case_folder, "parameters.json"), "w") as f:
                    json.dump(combined_parameters, f, indent=4)
                netlist_path = os.path.join(case_folder, test["testbench"])
                netlist_path = os.path.splitext(netlist_path)[0] + ".spice"
                missing_parameters = substitute_netlist_params(netlist_path, combined_parameters)
                if missing_parameters:
                    raise ValueError(f"Parameter replacement incomplete")
                condition_index += 1
                #run ngspice simulation
                print(f"[AK] Running ngspice simulation...")
                subprocess.run(["ngspice", "-b", netlist_path], check=True)
                #invoke python file with same name as netlist to plot results
                parser_path = os.path.join(tb_dir, test["parser"])
                print(f"[AK] Invoking parser {parser_path}...")
                try:
                    sys.path.insert(0, tb_dir)
                    parser_module = __import__(os.path.splitext(test["parser"])[0])
                    sys.path.pop(0)
                    parser_module.treat_results(output_file, combined_parameters)
                    #send results to a csv file inside test folder
                    case_results = parser_module.treat_results(output_file, combined_parameters)
                    with open(results_path, "a") as f:
                        for key in condition.keys():
                            f.write(f"{condition[key]},")
                        for value in case_results:
                            f.write(f"{value},")
                        f.write("\n")
                except Exception as e:
                    print(f"[AK] Error importing or running treat_results from {parser_path}: {e}")
                results.append((condition, case_results, output_file))                
            #After all sims, invoke plot function if it is defined, passing results and data file path
            if hasattr(parser_module, "plot"):
                print(f"[AK] Invoking plot function...")
                try:
                    parser_module.plot(results)
                except Exception as e:
                    print(f"[AK] Error running plot function: {e}")


def generate_condition_groups(conditions):
    """
    Given a dict of conditions (param: [values]), return a list of dicts,
    each representing a unique combination of parameter values.
    """
    keys = list(conditions.keys())
    values_product = list(itertools.product(*(conditions[k] for k in keys)))
    combinations = [dict(zip(keys, vals)) for vals in values_product]
    print(f'num_combinations: {len(combinations)}')
    for idx, combo in enumerate(combinations):
        print(f'Combination {idx}: {combo}')
    return combinations

def substitute_netlist_params(netlist_path, params):
    num_replacements = 0
    missing_parameters = 0
    with open(netlist_path, "r") as f:
        content = f.read()
    def replace_param(match):
        nonlocal num_replacements
        nonlocal missing_parameters
        param_name = match.group(1)
        if param_name in params:
            print(f"[AK] Replacing parameter '{param_name}' with value '{params[param_name]}'")
            num_replacements += 1
            return str(params[param_name])
        else:
            print(f"[AK] Parameter '{param_name}' not found")
            missing_parameters += 1
        return "{" + param_name + "}"
    new_content = re.sub(r"\{([^\{\}]+)\}", replace_param, content)
    with open(netlist_path, "w") as f:
        f.write(new_content)
    print(f"[AK] Finished substituting parameters in {netlist_path}. Total replacements: {num_replacements}")
    return missing_parameters

def generate_netlist(tb_path, netlist_folder):
            cmd = [
                "xschem",
                "--rcfile",
                "/usr/local/share/pdk/sky130A/libs.tech/xschem/xschemrc",
                "-nsq",
                tb_path,
                "-o",
                netlist_folder
            ]
            subprocess.run(cmd, check=True)

if __name__ == "__main__":
    #generate_netlists()
    load_config("scripts/config.json")