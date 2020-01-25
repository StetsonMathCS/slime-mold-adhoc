library(ggplot2)

output_dir = 'output/20191007_130508'

dtmp <- read.csv(paste(output_dir, "aodv/manet-routing.output.csv", sep="/"))
d <- dtmp[100:nrow(dtmp),]
dtmp <- read.csv(paste(output_dir, "olsr/manet-routing.output.csv", sep="/"))
d <- rbind(d, dtmp[100:nrow(dtmp),])
dtmp <- read.csv(paste(output_dir, "oplsr/manet-routing.output.csv", sep="/"))
d <- rbind(d, dtmp[100:nrow(dtmp),])

ggplot(d) + geom_line(aes(x=SimulationSecond, y=ReceiveRate, color=RoutingProtocol)) + scale_x_continuous(limits=c(100, 200))