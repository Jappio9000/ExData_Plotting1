plot4 <- function() {
  
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
  
  # convert to dates: (why?)
  test$V1 <- as.Date(test$V1, "%d/%m/%Y")
  # convert to times:
  # why?
  
  # First, reset the plot parameters and close any open connections if any
  dev.off()
  
  # Set the mfrow parameter to create a canvas for 4 plots
  par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  
  ## Make the plots
  # 1: the topleft plot (identical to plot2)      
    with(test, plot(Global_active_power, ylab = "Global Active Power", 
                  xaxt="n", xlab="", type="l"))
      # Add the x-axis names for the days
      axis(1, at=c(1,24*60,24*60*2), labels=c("Thu", "Fri", "Sat"))
  # 2: the topright plot
      with(test, plot(Voltage, ylab = "Voltage", 
                      xaxt="n", xlab="datetime", type="l"))
      # Add the x-axis names for the days
      axis(1, at=c(1,24*60,24*60*2), labels=c("Thu", "Fri", "Sat"))
  # 3: the bottomleft plot (identical to plot3)
      with(test, plot(Sub_metering_1, ylab = "Energy sub metering", 
                      xaxt="n", xlab="", type="l"))
      with(test, points(Sub_metering_2, col="red", type="l"))
      with(test, points(Sub_metering_3, col="blue", type="l"))
      
        # Add the x-axis names for the days
        axis(1, at=c(1,24*60,24*60*2), labels=c("Thu", "Fri", "Sat"))
        
        # Add the legend
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
               bty="n", col=c("black", "red", "blue"), text.width=strwidth("Sub_metering_1"), 
               xjust=1, yjust=1)    
  # 4: the bottomright plot
        with(test, plot(Global_reactive_power, ylab = "Global_reactive_power", 
                        xaxt="n", xlab="datetime", type="l"))
        # Add the x-axis names for the days
        axis(1, at=c(1,24*60,24*60*2), labels=c("Thu", "Fri", "Sat"))
        
        
  ## Write the plot to a png file
  dev.copy(png, file="plot4.png", width = 480, height = 480, units = "px")
  # close the graphics device (the file)
  dev.off()
}