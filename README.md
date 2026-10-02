# SIDONPAY Fintech Data Analytics

End-to-end data analytics project work for **SIDONPAY**, a simulated Nigeria-first, multi-currency digital wallet — covering market research, fraud detection, business intelligence & customer segmentation, and product-analytics funnel design. Completed as part of a Data Analyst/Scientist internship (Team Beta).

## Project sections

| # | Project | What it covers |
|---|---|---|
| 1 | [Market & Competitive Research](./01-market-research) | Positioning analysis against Wise, Chipper Cash, and Revolut |
| 2 | [Fraud Detection & Transaction Analysis](./02-fraud-detection) | Fraud patterns across 6.36M transactions; evaluation of an existing fraud rule (0.19% recall) and two proposed ML models |
| 3 | [Business Intelligence & Customer Segmentation](./03-business-intelligence-segmentation) | Transaction behavior, K-Means customer segmentation, executive dashboard |
| 4 | [Customer Journey & Funnel Analysis](./04-funnel-analysis) | Simulated onboarding funnel, bottleneck analysis, product recommendations |

Each folder has its own README with the key findings, file contents, and (where applicable) how to reproduce the analysis.

## Tools used

**Python** (pandas, scikit-learn, matplotlib) for data cleaning, exploratory analysis, and modeling · **Power BI** for executive dashboards · **Excel** for pivot-ready summaries · **Word / PowerPoint** for written reports and stakeholder presentations.

## Dataset

Projects 2 and 3 use the **PaySim** synthetic dataset — mobile money transactions modeled on one month of real logs from an African mobile financial service. 6,362,620 transactions, 8,213 confirmed fraud cases, 30-day simulation window.

- Source: [PaySim — Synthetic Financial Datasets For Fraud Detection (Kaggle)](https://www.kaggle.com/datasets/ealaxi/paysim1)
- Paper: Lopez-Rojas, E. A., Elmir, A., and Axelsson, S. *"PaySim: A financial mobile money simulator for fraud detection."* The 28th European Modeling and Simulation Symposium (EMSS), 2016.

The raw CSV (~493MB) is not included in this repo — see [`data/README.md`](./data/README.md) for the download link and how the notebooks expect it to be placed.

## Highlights

- Found that a fintech's existing fraud-flagging rule caught only **16 of 8,213** fraud cases (0.19% recall) despite 100% precision — a case study in why accuracy and precision alone can hide a broken detection system.
- Built and compared two classifiers (Logistic Regression, Random Forest) as proposed replacements.
- Segmented 6M+ simulated customers into 4 behavioral groups via K-Means, and documented a real methodology nuance (transaction-level IDs vs. true repeat-customer IDs) rather than glossing over it.
- Designed a full product-analytics funnel framework from first principles, grounding every synthetic assumption in patterns already found in the real transaction data.
