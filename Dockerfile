# Use official Miniconda base image
FROM continuumio/miniconda3

# Set working directory
WORKDIR /app

# Install system packages
RUN apt-get update && apt-get install -y libgl1 && apt-get clean

# Copy only environment + source code
COPY asp_environment.yml .
COPY src ./src

# Create conda environment
RUN conda env create -f asp_environment.yml

# Add environment to path
ENV PATH /opt/conda/envs/asp/bin:$PATH

# Shell will use the 'asp' environment
SHELL ["conda", "run", "-n", "asp", "/bin/bash", "-c"]

# Default command (script & config passed from outside)
ENTRYPOINT ["conda", "run", "-n", "asp", "python"]
