# Stress_tester
# Quantitative Data Pipeline & Risk Stress-Testing Simulator

An automated, end-to-end quantitative data engineering pipeline and risk simulation dashboard. This project connects an R-based financial data ingestion engine with a Power BI Business Intelligence interface, allowing users to run real-time market haircut simulations on historical asset data.

## ⚡ What It Does
* **Automates Data Ingestion:** An R script downloads **5 years of live market data** (Apple, Microsoft, Gold, S&P 500) from the Yahoo Finance API.
* **Cleans the Pipeline:** Power Query fixes regional decimal formatting issues to ensure data loads without errors.
* **Simulates Market Shocks:** A Power BI dashboard uses a dynamic slider and custom DAX metrics to simulate market drops ("haircuts") on a live timeline.

## 🛠️ Tech Stack
* **R** (`quantmod`) — Data fetching & automation
* **Power Query** — ETL & data cleanup
* **Power BI & DAX** — Dashboard visuals & simulation logic

## 🚀 How to Run It
1. **Run the R Script:** Run `scripts/market_ingestion.R` to download a fresh `Real_Market_Data.csv` file.
2. **Open the Dashboard:** Open `power_bi/stress_tester.pbip` in Power BI Desktop.
3. **Connect Data:** Point the data source to your new CSV file.
4. **Simulate:** Move the dashboard slider to see the S&P 500 line instantly drop.
