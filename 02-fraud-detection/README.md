# 02 — Fraud Detection & Transaction Analysis

Fraud pattern analysis on the full 6,362,620-row PaySim dataset: cleaning, transaction behavior analysis, fraud pattern investigation, evaluation of the dataset's built-in fraud-flagging rule, and two machine learning models built as a proposed improvement.

*Co-authored with Olaleye Jumoke Omowunmi, Team Beta.*

## Key findings

- **8,213 confirmed fraud cases** out of 6,362,620 transactions (0.13%), totaling **₦12.06 billion** in fraudulent transaction value.
- Fraud occurs **exclusively in TRANSFER and CASH_OUT** transactions (4,097 and 4,116 cases respectively) — PAYMENT, CASH_IN, and DEBIT recorded zero fraud cases.
- Fraud rate climbs sharply with transaction size: **2.07%** for transactions above ₦1M vs. an overall rate of 0.13%.
- The dataset's existing `isFlaggedFraud` rule flagged only **16 of 8,213** actual fraud cases — **100% precision, but just 0.19% recall**. 99.87% overall accuracy is misleading here, since fraud is such a small share of all transactions that a model predicting "never fraud" would still score similarly high.

## Model results

Two classifiers were built as a proposed improvement over the existing rule, using `step`, `type`, and `amount` as features (the dataset's balance columns — `oldbalanceOrg`, `newbalanceOrig`, `oldbalanceDest`, `newbalanceDest` — were deliberately excluded as predictors, per the dataset's own documentation, since fraudulent transactions are cancelled in the simulation and these fields become unreliable for fraud rows specifically):

| Model | Accuracy | Precision | Recall | F1 | ROC-AUC |
|---|---|---|---|---|---|
| Logistic Regression | 78.99% | 0.54% | 87.95% | 0.0107 | 0.919 |
| Random Forest | 99.86% | 43.48% | 38.34% | 0.408 | 0.848 |

Both models represent a large improvement in fraud *coverage* over the existing rule's 0.19% recall, with a precision/recall trade-off to choose between depending on whether SIDONPAY prioritizes catching more fraud (Logistic Regression's high recall) or fewer false alarms (Random Forest's better precision).

## Contents

| File | Description |
|---|---|
| `fraud-detection-report.pdf` | Written report: methodology, key results table, flag evaluation, recommendations |
| `fraud-detection-dashboard.pdf` | 5-page Power BI dashboard export: Transaction Overview, Fraud Pattern Analysis, User & Transaction Behaviour, Flag Evaluation, Recommendations |
| `notebooks/fraud_detection_analysis.ipynb` | Full Python analysis: data cleaning, EDA, fraud pattern analysis, flag evaluation, and both models |

## Recommendations

- Prioritize TRANSFER and CASH_OUT monitoring — these account for all observed fraud.
- Use transaction amount as a risk *signal*, not an automatic fraud rule — large transactions carry more risk but most fraud still occurs below the highest amount bands.
- Move beyond a single threshold rule; its 0.19% recall means the vast majority of fraud goes undetected.
- Build multi-signal monitoring combining transaction type, amount, behavioral signals, and transaction sequence (e.g. TRANSFER immediately followed by CASH_OUT).

## Reproducing this analysis

See [`../data/README.md`](../data/README.md) for how to download the dataset. Once placed, run the notebook directly — it loads the CSV via a relative path (`../../data/...`).
