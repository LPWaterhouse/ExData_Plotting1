## This code will read data and generate plot1 work ExData HW1

  ## read the data
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  
  ## convert "Date" column to Date class and "Time" column to Time class
  
  data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
  data[,3] <- as.numeric(data[,3])
  ##data[,2] <- strptime(data[,2], format = "%H:%M:%S")
  
  ##convert to dplyr tbl class
  
  data_tbl <- tbl_df(data)
  
  data_tbl2 <- mutate(data_tbl, Global_active_power_KW = Global_active_power/1000)
  
  data_tbl3 <- filter(data_tbl2, Date >= "2007-02-01", Date <= "2007-02-02")
  
  ## make chart
  

  plot(data_tbl3$Time, data_tbl3$Global_active_power)