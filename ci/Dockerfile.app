# Start from a clean, lightweight Node.js base image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Only copy the built artifacts and necessary files from the builder stage
COPY --from=builder /app/build /app
COPY --from=builder /app/node_modules /app/node_modules

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
