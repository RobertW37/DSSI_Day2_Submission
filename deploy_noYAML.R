model = readRDS("bar_sales.rds")

#* Test connection
#* @get /connection

function(){
  list(status = paste("Welcome", Sys.getenv('username'), "to DSSI. We are a go!"),
       time = Sys.time())
}

#* predict the sales of energy bar
#* @param Price price of the energy bar
#* @param Promotion amount of investment for promotion
#* @param ShelfLocation Normal/EndAisle
#* @param Dispensers whether there are coupon dispensers

#* @post /predict
function(Price, Promotion, ShelfLocation, Dispensers){
  newdata = data.frame(Price = as.numeric(Price), Promotion = as.numeric(Promotion),
                       ShelfLocation = ShelfLocation, Dispensers = Dispensers)
  predict(model, newdata)
}




