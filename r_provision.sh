#! /bin/bash R

echo "Installing R ..."
if [ -f /usr/bin/R ]; then 
  echo "R is already installed ..."
else
  sudo apt-get install -y r-base
  echo "R was successfully installed ..."
fi
echo "Please type R in the command line." 


echo "Installing RStudio ..."
if [ -f /usr/bin/rstudio ]; then 
  echo "RStudio is already installed."
else
  cd ~/Downloads 
  if [ ! -f rstudio-0.98.1062.deb ]; then 
    proc=`uname -i`
    if [ "${proc}" = "x86_64" ] || [ "${proc}" = "amd64" ] ; then 
      wget http://download1.rstudio.org/rstudio-0.98.1062-amd64.deb -O rstudio-0.98.1062.deb
    else 
      wget http://download1.rstudio.org/rstudio-0.98.1062-x866.deb -O rstudio-0.98.1062.deb
    fi
  fi

  if [ -f "rstudio-0.98.1062.deb" ]; then
    sudo apt-get install -y libjpeg62 
    sudo dpkg -i rstudio-0.98.1062.deb
    if [ $? = 0 ]; then 
      echo "RStudio was successfully installed." 
    else
      echo "RStudio installation encountered an error."
    fi
  else
    echo "Encountered problems downloading the file"
  fi 
#fi
