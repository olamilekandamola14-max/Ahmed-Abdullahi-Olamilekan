# Data

The notebooks in this repository (`02-fraud-detection/` and `03-business-intelligence-segmentation/`) expect the raw PaySim dataset here, at:

```
data/PS_20174392719_1491204439457_log.csv
```

## Download

The file is ~493MB and is **not included in this repository** (GitHub blocks files over 100MB, and a file this size has no place in git history regardless).

1. Download it from Kaggle: [PaySim — Synthetic Financial Datasets For Fraud Detection](https://www.kaggle.com/datasets/ealaxi/paysim1)
2. Place the extracted CSV in this `data/` folder, keeping the original filename (`PS_20174392719_1491204439457_log.csv`)
3. Run the notebooks from their own folders — they reference the file via a relative path (`../../data/...`), so no code changes should be needed.

## About the dataset

PaySim simulates mobile money transactions based on one month of real transaction logs from an African mobile financial service. 6,362,620 transactions, 8,213 confirmed fraud cases, 744 hourly time steps (30-day simulation).

Citation: Lopez-Rojas, E. A., Elmir, A., and Axelsson, S. *"PaySim: A financial mobile money simulator for fraud detection."* The 28th European Modeling and Simulation Symposium (EMSS), 2016.
