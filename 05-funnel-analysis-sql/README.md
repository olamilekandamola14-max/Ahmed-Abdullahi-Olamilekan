# 05 · E-commerce Funnel Analysis (SQL)

Week 7 applies funnel analysis to **real GA4-style event data** (13,125 events, 3,774 users) using **MySQL**, after Week 6 designed the framework on simulated data. The data was too large for Excel, so all aggregation was done in SQL.

## Files

| File | Purpose |
|---|---|
| [`funnel_analysis.sql`](./funnel_analysis.sql) | Full MySQL script: unique-event table, top-3 countries, funnels by country, plus OS / medium / browser slices |
| [`funnel-analysis-workbook.xlsx`](./funnel-analysis-workbook.xlsx) | Results workbook: Unique Event Table, Top Countries, Funnel Analysis and Charts, Other Slices, Queries Used |
| [`insights-memo.pdf`](./insights-memo.pdf) | Insights memo: methodology, findings, hypotheses, limitations |

## Approach

1. **Unique events** – `ROW_NUMBER()` partitioned by `user_pseudo_id, event_name` keeps each user's earliest occurrence of each event (8,530 rows).
2. **Top 3 countries** – ranked by total events: United States (5,859), India (1,378), Canada (864).
3. **Funnel** – distinct users per stage: `page_view → view_item → add_to_cart → begin_checkout → add_payment_info → purchase`, per country.
4. **Extra slices** – funnel by operating system, traffic medium and browser.

## Key findings

| Stage | Full | US | India | Canada | % of step 1 |
|---|---|---|---|---|---|
| page_view | 2,075 | 915 | 201 | 158 | 100% |
| view_item | 392 | 176 | 35 | 28 | 18.9% |
| add_to_cart | 90 | 38 | 6 | 8 | 4.3% |
| begin_checkout | 40 | 17 | 5 | 6 | 1.9% |
| add_payment_info | 23 | 5 | 6 | 4 | 1.1% |
| purchase | 4 | 3 | 0 | 1 | 0.19% |

- The biggest leaks are at the top: 81% never view a product, and 77% of viewers never add to cart.
- Checkout itself is relatively healthy; the final step is a cliff (4 of 23 payment-info users purchase).
- The US supplies 44% of visitors but 75% of purchases; India has 0 purchases despite 6 payment-info users.

## Hypotheses (to test, not proven)

- **H1** – Landing pages don't lead shoppers to products (weak discovery/search).
- **H2** – Price or shipping uncertainty stops add-to-cart.
- **H3** – Payment failure or missing local payment options drive final-step loss, especially in India.

## Limitations

Only 4 purchases, so country rates are indicative, not statistically reliable. Stage counts are independent distinct users, not strict sequences (5 of 23 payment-info users never logged `begin_checkout`), so some ratios can exceed 100%. Next steps: longer date range, session-level sequential funnels, slicing by device, landing page and campaign.

## Data

The source `raw_events` table (3.5MB CSV) is not included; load it into a MySQL database named `funnel_analysis` before running the script.
