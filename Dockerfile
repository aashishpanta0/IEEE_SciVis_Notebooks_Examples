FROM --platform=linux/amd64 continuumio/miniconda3:23.10.0-1

# Set the working directory
WORKDIR /workspaces

# Install any necessary dependencies
RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
COPY environment.yml /workspaces/
RUN conda env create -f environment.yml
SHELL ["conda", "run", "-n", "OpenVisus-NASA", "/bin/bash", "-c"]


EXPOSE 8989 5000

RUN conda init
CMD ["conda", "run","-n", "OpenVisus-NASA","jupyter", "lab", "--port=5000", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''","--NotebookApp.password=''"]
