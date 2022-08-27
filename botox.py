from ax import optimize
from Fof002 import Fof002

print(optimize.__class__.__name__ )
fof = Fof002();
best_parameters, best_values, experiment, model = optimize(
        parameters=[
          {
            "name": "x",
            "type": "range",
            "bounds": [-63.0, 63.0],
          }
        ],
        # Booth function
    evaluation_function=lambda p: fof.getYforX(p["x"]),
        minimize=True,
    )

                                                

print(best_parameters)
print(experiment)
