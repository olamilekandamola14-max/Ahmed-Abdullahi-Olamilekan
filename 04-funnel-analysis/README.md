# 04 — Customer Journey & Funnel Analysis (Simulated)

SIDONPAY is pre-launch with no real user data yet, so this project builds the analytical framework ahead of time: map the 5-stage customer journey (Awareness → Sign-Up → Verification/KYC → First Transaction → Repeat Usage), define the metrics that matter at each stage, and simulate a believable dataset to practice spotting bottlenecks.

## Key finding

The funnel's biggest simulated leak is First-Transaction-to-Repeat-Usage (65% drop-off, even under an optimistic 35% repeat-rate assumption). This isn't an arbitrary guess — it's grounded in the real transaction data from the fraud detection and segmentation projects in this repo, where the overwhelming majority of accounts had only one transaction in the simulated month. If SIDONPAY's real numbers land anywhere near that historical pattern, retention — not fraud, not onboarding — becomes the platform's single largest risk.

## Contents

| File | Description |
|---|---|
| `funnel-analysis-framework.docx` | Full framework: stage-by-stage journey definitions, synthetic funnel data, bottleneck analysis, recommendations, cited sources |
| `funnel-analysis-presentation.pptx` | Presentation version |
| `synthetic_funnel_data.csv` | The simulated 100,000-user cohort funnel data referenced in the framework |

## Funnel stages

Awareness → Sign-Up → Verification (KYC) → First Transaction → Repeat Usage — each stage defined by user intention, required actions, success/failure factors, and key metrics in the framework document.
