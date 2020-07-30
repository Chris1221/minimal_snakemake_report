import matplotlib
from matplotlib import pyplot as plt
import numpy as np
import math 

matplotlib.use("Agg")

report: "report/report.rst"

rule collect_results:
  input: "tan_function.png"

rule _example_text:
  output: report("example.csv", caption = "report/csv.rst", category = "CSV Output.")
  shell: "echo 1,2,3 > {output}; echo 2,3,4 >> {output}"

rule _example_plot:
  input: "example.csv"
  output: png = report("tan_function.png", caption = "report/tan_function.rst", category = "Tan function")
  run:
    x = np.arange(0, math.pi*2, 0.05)
    y = np.tan(x)
    plt.plot(x,y)
    plt.xlabel("angle")
    plt.ylabel("Tan value")
    plt.title('Tan wave')
    plt.savefig(output.png)

