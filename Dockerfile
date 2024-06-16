
# Use the official Dart image for the base
FROM dart:stable as build

# Set the working directory
WORKDIR /app

# Copy the pubspec files and run pub get to fetch dependencies
COPY pubspec.yaml pubspec.lock ./
RUN dart pub get

# Copy the rest of the application code
COPY . .

# Build the application
RUN dart pub get --offline
RUN dart compile exe bin/server.dart -o bin/server

# Use a minimal runtime image for the final build
FROM scratch as runtime

# Copy the compiled server from the build stage
COPY --from=build /runtime/ /

# Set the entrypoint to the compiled server binary
ENTRYPOINT ["/bin/server"]
