'''
BIN FOR TRIAL CODE

#use function to check on the type of data that the variable is
class(ward_num_water_consump$ward_num)


#previously used boxplot code - better to be familiar with the ggplot boxplot
boxplot(consump_water ~ ward_num, data = ward_num_water_consump, xlab = "Ward Number", ylab = "Water consumption (liters)") 

#programmed a for loop - go through ward_num list and add in elements to new_ward_num_list ONCE
then used new_ward_num_list to get a summary of water consumption for each ward 
added in a counter to make sure the loop was going through the whole list


ward_num_list <- ward_num_water_consump$ward_num
new_ward_num_list <- numeric()
i_counter <- 0

for (i in 1:length(ward_num_list)) {
  {
  i_counter <- i_counter + 1}
  if (!(ward_num_list[i] %in% new_ward_num_list)){
    new_ward_num_list <- append(new_ward_num_list, ward_num_list[i])
  } 
  new_ward_num_list
}

#The information provided by this code is given by the group_by() function

#get the summary or the average of the water consumption in each ward
for (i in new_ward_num_list){print(i)
  print(ward_num_water_consump %>% filter(ward_num == i) %>% select(consump_water) %>% colMeans())
  #print(ward_num_water_consump %>% filter(ward_num == i) %>% select(consump_water) %>% summary())
}


# used the output from the unique code function
for (i in elements_ward_num){
  cat( 'ward number', i, "\n")
  cat('Average water consumption -', ward_num_water_consump %>% filter(ward_num == i) %>% select(consump_water) %>% colMeans(), "\n")
  #print(ward_num_water_consump %>% filter(ward_num == i) %>% select(consump_water) %>% summary())
}

#Code to count the number or people in each ward
for (i in elements_ward_num){
  cat('ward number', i, '-', (length(which(ward_num_water_consump[1] == i))), "\n")
}

consump_water_ward_num <- select(water_data, ward_num, source_water, consump_water, storageplace_water) %>% filter(ward_num <= 7) %>% na.omit()

ggplot(data = consump_water_ward_num) +
  geom_histogram(mapping = aes(consump_water, fill = source_water), bins = 15)
