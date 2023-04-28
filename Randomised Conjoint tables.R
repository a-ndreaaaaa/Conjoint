# To edit the following loop for other conjoints, edit the 'attr' list with the text used for attribute name
# and edit the 'name' variable with whatever label you want


## NESTED NESTED LOOP - almost there, just naming struggle

# create an empty list to store the matrices
choice_data <- list()

# loop through each attribute

for (attr in c("Elections for political leadership in this country are‚Ä¶",
               "The powers of the country‚Äôs leader are‚Ä¶", 
               "Citizens‚Äô individual liberties, such as freedom of speech, religion, and assembly are‚Ä¶",
               "The economic situations of the rich and the poor are‚Ä¶", 
               "The rights of men and women are‚Ä¶",
               "When making policies, politicians‚Ä¶",
               "The people vote directly on policy decisions‚Ä¶", 
               "Independent, non-elected experts have‚Ä¶",
               "When citizens dislike their government‚Äôs policies‚Ä¶")) {
  
  # create an empty matrix to store the choices for the current attribute
  choice_matrix1 <- matrix(NA, nrow(d_sand_definition), 3)
  choice_matrix2 <- matrix(NA, nrow(d_sand_definition), 3)
  
  # loop through each row and fill in the choice variables for the current attribute
  for (j in 1:3) {
    for (i in 1:nrow(d_sand_definition)) {
      if (d_sand_definition[[paste0('choice', j, '_attrib1_name')]][i] == paste(attr)){
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib1_c1')]][i]
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib1_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib2_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib2_c1')]][i]
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib2_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib3_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib3_c1')]][i]
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib3_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib4_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib4_c1')]][i]
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib4_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib5_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib5_c1')]][i]
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib5_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib6_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib6_c1')]][i]
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib6_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib7_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib7_c1')]][i]
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib7_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib8_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib8_c1')]][i] 
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib8_c2')]][i]
      } else if (d_sand_definition[[paste0('choice', j, '_attrib9_name')]][i] == paste(attr)) {
        choice_matrix1[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib9_c1')]][i]  
        choice_matrix2[i, j] <- d_sand_definition[[paste0('choice', j, '_attrib9_c2')]][i]
      }
    }
  }
  
  # turn the matrices into dataframes and add names
  
  if (attr  == "Elections for political leadership in this country are‚Ä¶"){
    name = "election" }
  else if (attr  == "The powers of the country‚Äôs leader are‚Ä¶"){
    name = "leader" }
  else if (attr  == "Citizens‚Äô individual liberties, such as freedom of speech, religion, and assembly are‚Ä¶"){
    name = "civil" }
  else if (attr  == "The economic situations of the rich and the poor are‚Ä¶"){
    name = "econ" }
  else if (attr  == "The rights of men and women are‚Ä¶"){
    name = "gender" }
  else if (attr  == "When making policies, politicians‚Ä¶"){
    name = "populist" }
  else if (attr  == "The people vote directly on policy decisions‚Ä¶"){
    name = "direct" }
  else if (attr  == "Independent, non-elected experts have‚Ä¶"){
    name = "expert" }  
  else if (attr  == "When citizens dislike their government‚Äôs policies‚Ä¶"){
    name = "obedient" }    
  
  choice_df1 = as.data.frame(choice_matrix1)
  names(choice_df1) = c(paste0('choice', 1, '_', name, '1'), paste0('choice', 2, '_', name, '1'), paste0('choice', 3, '_', name, '1'))
  
  choice_df2 = as.data.frame(choice_matrix2)
  names(choice_df2) = c(paste0('choice', 1, '_', name, '2'), paste0('choice', 2, '_', name, '2'), paste0('choice', 3, '_', name, '2'))
  
  # combine them
  dfs = cbind(choice_df1, choice_df2)
  
  # then add them all to the empty list
  names(choice_data) = NULL
  choice_data[[name]] = dfs
  
}

# WHY ISN'T THE LAST NAME ITERATING
# lets just do it outside the loop

names(choice_data) = NULL
merged_data = do.call(cbind, choice_data)

d_sand_definition = cbind(d_sand_definition, merged_data)