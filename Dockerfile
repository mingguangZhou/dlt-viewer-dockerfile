# Base image
FROM ubuntu:22.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV QT_QPA_PLATFORM=xcb

# Install required dependencies
RUN apt-get update && apt-get install -y \
    fuse \
    libfuse2 \
    ca-certificates \
    libqt5widgets5 \
    libqt5gui5 \
    libqt5core5a \
    libudev1 \
    libglib2.0-0 \
    libpng16-16 \
    libicu-dev \
    libxcb1 \
    libxcb-xinerama0 \
    libx11-xcb1 \
    libxrender1 \
    libxrandr2 \
    libxi6 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy all required files into the image
COPY . /app

# Grant necessary privileges to AppImage and make it executable
RUN chmod +x /app/DLTViewer-2.25.0-STABLE-qt5.12.10-r960_x86_64-linux-gnu_11.4.0.AppImage

# Command to start the AppImage when running the container
CMD ["/app/DLTViewer-2.25.0-STABLE-qt5.12.10-r960_x86_64-linux-gnu_11.4.0.AppImage"]

