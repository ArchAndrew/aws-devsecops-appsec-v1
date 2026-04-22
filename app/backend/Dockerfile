FROM python:3.11-slim

# Set working directory
WORKDIR /app


# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV HOME=/home/appuser

# Copy requirements first (better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Create non-root user (security best practice)
RUN useradd -m -u 10001 appuser && chown -R appuser:appuser /app
USER appuser

# Expose port
EXPOSE 8080

# Run app
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8080", "app:app"]
