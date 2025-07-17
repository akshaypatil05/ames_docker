# Use official Miniconda base image
FROM continuumio/miniconda3

# Set working directory
WORKDIR /app

# Create environment
RUN apt-get update && apt-get install -y libgl1

# Copy Conda environment file
COPY asp_environment.yml .

RUN conda env create -f asp_environment.yml

# Ensure the environment is used for all RUN/CMD
SHELL ["conda", "run", "-n", "asp", "/bin/bash", "-c"]

# Copy entire repo
COPY . .

# Set default command to use 'conda run' and allow override from CLI
ENTRYPOINT ["conda", "run", "-n", "asp", "python"]