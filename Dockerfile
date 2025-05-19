FROM jupyter/base-notebook

# Start as root to adjust ownership
USER root

# Set workdir (owned by jovyan, but might get files owned by root after COPY)
WORKDIR /home/jovyan

# Copy files as root
COPY --chmod=755 ./aznbsetup.sh ./aznbsetup.sh
COPY . .

# Fix ownership
RUN chown -R jovyan:users /home/jovyan

# Drop privileges
USER jovyan

# Run setup script
RUN ./aznbsetup.sh

EXPOSE 8888
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]