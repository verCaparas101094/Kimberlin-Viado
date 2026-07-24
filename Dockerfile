FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY KimberlinViado.Portfolio.csproj ./
RUN dotnet restore KimberlinViado.Portfolio.csproj

COPY . ./
RUN dotnet publish KimberlinViado.Portfolio.csproj \
    --configuration Release \
    --output /app/publish \
    --no-restore \
    /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish ./

ENV ASPNETCORE_ENVIRONMENT=Production \
    DOTNET_EnableDiagnostics=0

USER $APP_UID
EXPOSE 10000

ENTRYPOINT ["sh", "-c", "exec dotnet KimberlinViado.Portfolio.dll --urls http://0.0.0.0:${PORT:-10000}"]
