from ax.service.ax_client import AxClient
from Fof002 import Fof002
from Demo import Demo
import os
import subprocess

demo = Demo();

fof = Fof002();

ax_client = AxClient()


ax_client.create_experiment(
    name="foo",
    parameters=demo.params,
    objective_name="fof",
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

    

    return {"fof": result}
   


for i in range(100):
    parameters, trial_index = ax_client.get_next_trial()
    try:
        ax_client.complete_trial(trial_index=trial_index, raw_data=evaluate(parameters))
    except BaseException as err:
        print(f"Unexpected {err=}, {type(err)=}")
        ax_client.log_trial_failure(trial_index=trial_index)



        
print(ax_client.get_trials_data_frame())
print(ax_client.get_best_parameters()[0]);
print(ax_client.get_best_parameters()[1]);
