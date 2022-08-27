from ax.service.ax_client import AxClient
from Fof002 import Fof002


fof = Fof002();

ax_client = AxClient()


ax_client.create_experiment(
    name="hartmann_test_experiment",
    parameters=[
    {
        "name": "x",
        "type": "range",
        "bounds": [-63.0, 63.0],
        "value_type": "float",  # Optional, defaults to inference from type of "bounds".
        "log_scale": False,  # Optional, defaults to False.
    }],
    objective_name="fof",
    minimize=False,
)



def evaluate(parameters):
    print(parameters)
    return {"fof": fof.getYforX(parameters["x"])}


for i in range(25):
    parameters, trial_index = ax_client.get_next_trial()

    ax_client.complete_trial(trial_index=trial_index, raw_data=evaluate(parameters))
        
