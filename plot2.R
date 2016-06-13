plot2 <- function() {
  
  ## Read in the data
  # This script assumes that the dataset resides in the current working directory
  # filename = "household_power_consumption.txt"
  fname = "household_power_consumption.txt"
  
  # read in the data
  test <- read.table(fname, sep=";", skip=grep("1/2/2007", 
                                               readLines(fname)), nrows= (24*60*2))
  # read in the column names as characters
  cnames <- read.table(fname, sep=";", nrows= 1, as.is=c(1:9))
  # assign column names
  names(test) <- cnames
  
  # First, reset the plot parameters and close any open connections if any
  dev.off()
  
  ## Make the plot
  with(test, plot(Global_active_power, ylab = "Global Active Power (kilowatts)", 
                  xaxt="n", xlab="", type="l"))
  # Add the x-axis names for the days
  axis(1, at=c(1,24*60,24*60*2), labels=c("Thu", "Fri", "Sat"))
  
  ## Write the plot to a png file
  dev.copy(png, file="plot2.png", width = 480, height = 480, units = "px")
  # close the graphics device (the file)
  dev.off()
}