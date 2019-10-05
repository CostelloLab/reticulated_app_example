library(shiny)
library(DT)
library(RColorBrewer)
plot_cols <- brewer.pal(11, 'Spectral')

# Based on this (https://rdrr.io/github/rstudio/rsconnect/src/tests/testthat/test-bundle.R)
# I originally thought this option needs to be FALSE but not sure now
#options(rsconnect.python.enabled = F)
#getOption('rsconnect.python.enabled')

shinyServer(function(input, output) {
  
  if (!Sys.info()[['sysname']] == 'Darwin'){
    reticulate::virtualenv_create(envname = 'python35_env', python= '/usr/bin/python3')
    reticulate::virtualenv_install('python35_env', packages = c('numpy'))
  } 
  reticulate::use_virtualenv('python35_env', required = TRUE)
  reticulate::source_python('python_functions.py')
  
  # Generate the requested distribution
  d <- reactive({
    dist <- switch(input$dist,
                   norm = rnorm,
                   unif = runif,
                   lnorm = rlnorm,
                   exp = rexp,
                   rnorm)
    
    return(dist(input$n))
  })
  
  # Generate a plot of the data
  output$plot <- renderPlot({
    dist <- input$dist
    n <- input$n
    
    return(hist(d(),
                main = paste0('Distribution plot: ', dist, '(n = ', n, ')'),
                col = plot_cols))
  })
  
  # Testing that the Python functions have been imported
  output$message <- renderText({
    return(test_string_function(input$str))
  })
  
  # Testing that numpy function can be used
  output$xy <- renderText({
    z = test_numpy_function(input$x, input$y)
    return(paste0('x + y = ', z))
  })
  
  # Display info about the system running the code
  output$sysinfo <- DT::renderDataTable({
    s = Sys.info()
    df = data.frame(Info_Field = names(s),
                    Current_System_Setting = as.character(s))
  })
  
  # Display system path to python
  output$python_version <- renderText({
    paste0('which python: ', Sys.which('python'))
  })
  
  # Display whether rsconnect opt was enabled
  output$rsconnect_opt <- renderText({
    paste0('rsconnect.python.enabled: ', getOption('rsconnect.python.enabled'))
  })
  
  # Display whether a path to virtualenv was provided
  output$virtualenv_defined <- renderText({
    paste0('Virtualenv defined by user? ', DEFINE_VIRTUALENV)
  })

  # Display RETICULATE_PYTHON
  output$ret_env_var <- renderText({
    paste0('echo $RETICULATE_PYTHON: ', Sys.getenv('RETICULATE_PYTHON'))
  })
  
  # Display RETICULATE_PYTHON_ENV?
  output$ret_env <- renderText({
    paste0('echo $RETICULATE_PYTHON_ENV: ', Sys.getenv('RETICULATE_PYTHON_ENV'))
  })
  
  # Display PATH
  output$path <- renderText({
    paste0('PATH: ', Sys.getenv('PATH'))
  })
  
})