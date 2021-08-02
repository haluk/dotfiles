import sys

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy as sp

# Display floats with 3 decimal places
np.set_printoptions(precision=3)
pd.options.display.float_format = "{:,.3f}".format

# Expand display limits
pd.options.display.max_rows = 200
pd.options.display.max_columns = 100

# Matplotlib style
plt.style.use("ggplot")

