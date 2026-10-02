#The core idea behind this code is to bypass manual data
#entry by building an automated quantitative data engineering pipeline

install.packages("quantmod")
library(quantmod)

print("???? Fetching live market data from Yahoo Finance...")
# 2. Define the tickers you want to download
# AAPL (Apple), MSFT (Microsoft), GLD (Gold ETF), ^GSPC (S&P 500 Index)
tickers <- c("AAPL", "MSFT", "GLD", "^GSPC")
# 3. Download 5 years of daily closing prices directly into an environment object
getSymbols(tickers, src = "yahoo", from = Sys.Date() - (5 * 365), to = Sys.Date())
# 4. Extract only the Adjusted Closing Prices and merge them into one clean dataset
real_market_data <- merge(
  Cl(AAPL), 
  Cl(MSFT), 
  Cl(GLD), 
  Cl(GSPC)
)
# 5. Clean column names so they look beautiful
colnames(real_market_data) <- c("Apple", "Microsoft", "Gold", "SP500")
# 6. Drop any rows with missing data automatically
real_market_data_clean <- na.omit(real_market_data)
# 7. Convert to a standard data frame and move dates to a column for Power BI
final_dataframe <- data.frame(
  Date = index(real_market_data_clean), 
  coredata(real_market_data_clean)
)
# 6. EXPLICITLY HARDCODE YOUR CHOSEN PATH
# Note: R uses forward slashes (/) for folder locations on Windows!
file_destination <- "C:/Users/User/Desktop/M/Real_Market_Data.csv"

# 7. Write the data out into your target folder
write.csv(final_dataframe, file = file_destination, row.names = FALSE)
print("--- DATA PREVIEW ---")
print(head(final_dataframe))






