from ax.service.ax_client import AxClient
from Fof002 import Fof002
from Demo import Demo
import os
import subprocess

demo = Demo();

fof = Fof002();

ax_client = AxClient()


ax_client.create_experiment(
    name="autotune",
    parameters=demo.params,
    objective_name="score",
    minimize=False,
)



def evaluate(parameters):
    cmd = "sh demo.sh "
    for name in parameters:
        cmd +="\""
        cmd += str(parameters[name])
        cmd += "\" "
    print(cmd)

    proc = subprocess.Popen([cmd], stdout=subprocess.PIPE, shell=True)
    (out, err) = proc.communicate()
    result= float(out)

    

    return {"score": result}
   


for i in range(25):
    parameters, trial_index = ax_client.get_next_trial()
    try:
        ax_client.complete_trial(trial_index=trial_index, raw_data=evaluate(parameters))
    except BaseException as err:
        print(f"Unexpected {err=}, {type(err)=}")
        ax_client.log_trial_failure(trial_index=trial_index)



text_file = open("results.xml", "w")
text_file.write("<results>\n")                        
xml = ax_client.get_trials_data_frame().to_xml().replace("<?xml version='1.0' encoding='utf-8'?>", "")

text_file.write(xml)
text_file.write("\n\n<best-result>\n")



text_file.write("<score>" + str(ax_client.get_best_parameters()[1][0]["score"]) + "</score>\n");
text_file.write("\n")
best_params = ax_client.get_best_parameters()[0];
best_params_keys = best_params.keys();
for best_param in best_params_keys:
    text_file.write("\t<param><name>" + best_param + "</name><value>" + str(best_params[best_param]) + "</value></param>\n")
text_file.write("</best-result>\n")                
text_file.write("</results>")                
text_file.close()
