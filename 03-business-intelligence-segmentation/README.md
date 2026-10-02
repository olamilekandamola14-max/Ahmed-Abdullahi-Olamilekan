# 03 — Business Intelligence, Customer Segmentation & Executive Dashboard

Moves from fraud-focused analysis to business intelligence: transaction behavior, customer segmentation, and operational performance, treating the PaySim dataset as SIDONPAY's own first month of live transaction history.

## Key findings

- **6,362,620 transactions**, **₦1.14 trillion** total value, **₦179,860** average transaction value.
- Peak activity hour: **18:00** (647,814 transactions) — the busiest single hour in the simulation.
- Customer segmentation (K-Means, k=4, on transaction frequency, average amount, and total amount) produced four segments:

| Segment | Share of Customers | Avg. Transaction Amount |
|---|---|---|
| Premium Balance Users | 40.85% | ₦247,310 |
| Everyday Users | 35.24% | ₦9,940 |
| High-Value Edge Users | 23.62% | ₦316,680 |
| Active Value Users | 0.29% | ₦183,160 |

### Note on methodology

Segmentation here is built on `nameOrig` (the originating/sending account). Worth knowing if you extend this analysis: in this dataset, 99.85% of `nameOrig` IDs appear in only one transaction — so these segments reflect *transaction profiles* more than *repeat-customer relationships*. A complementary view segmenting the receiving account field (`nameDest`, where 571,961 accounts show genuine repeat behavior) would be the one to use for retention or lifetime-value analysis specifically. Both the dashboard and the written report are explicit about this distinction rather than treating "customer" as self-evident.

## Contents

| File | Description |
|---|---|
| `business-intelligence-report.docx` | Full written report: transaction overview, operational performance, segment profiles & recommendations, stakeholder-specific recommendations (Executive/Product/Marketing/Risk) |
| `business-intelligence-presentation.pptx` | Stakeholder presentation version |
| `bi-dashboard.pdf` | 2-page Power BI dashboard export: Business Intelligence Overview, Customer Behaviour & Segmentation |
| `notebooks/segmentation_analysis.ipynb` | Full Python analysis: data quality checks, transaction behavior, customer-level aggregation, K-Means segmentation, operational performance, fraud summary |

## Reproducing this analysis

See [`../data/README.md`](../data/README.md) for how to download the dataset, then run the notebook directly.
