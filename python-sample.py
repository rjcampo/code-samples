import pandas as pd
import os
import statsmodels.api as sm
import matplotlib.pyplot as plt
import seaborn as sns

PATH = r"C:\Users\RichardCampo\Documents\GitHub\code-samples"
df_acs = pd.read_csv(os.path.join(PATH, "acs2022.csv"))

fig, ax = plt.subplots()

sns.regplot(
    df_acs, 
    x = "EDUCDC", 
    y = "INCWAGE_LOG", 
    scatter_kws={'color': 'white', 'edgecolors': 'black'},
    line_kws={'color': 'red'},
    ax=ax
    )

ax.set_xlabel("Years of Education")
ax.set_ylabel("Log Income")
ax.set_title("Relationship between Education Level and ln(Income)")

plt.show()

predictors = ["EDUCDC", "FEMALE", "AGE", "AGESQ", "WHITE", "BLACK", "HISPANIC", 
"MARRIED", "NCHILD", "VET", "HSDIP", "COLDIP", "HSDIP-EDUCDC", "COLDIP-EDUCDC"]

X = df_acs[predictors]
X = sm.add_constant(X)
y = df_acs["INCWAGE_LOG"]

model = sm.OLS(y, X).fit()
print(model.summary())