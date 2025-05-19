# Use an official Jupyter Notebook base image
FROM jupyter/base-notebook

# Set the working directory inside the container
WORKDIR /home/work

# Use root to install git
USER root
RUN apt-get update && apt-get install -y git && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the project files, including aznbsetup.sh
COPY --chmod=777 ./aznbsetup.sh .

# Install dependencies using the aznbsetup.sh script
RUN ./aznbsetup.sh

COPY . .

# Expose the default Jupyter Notebook port
EXPOSE 8888

# Start Jupyter Notebook without a token or password
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]