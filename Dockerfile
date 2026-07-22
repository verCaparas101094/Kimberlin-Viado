FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY KimberlinViado.Portfolio.csproj ./
RUN dotnet restore KimberlinViado.Portfolio.csproj

COPY . ./
RUN dotnet publish KimberlinViado.Portfolio.csproj \
    --configuration Release \
    --output /app/publish \
    /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish ./

ENV ASPNETCORE_URLS=http://0.0.0.0:10000
EXPOSE 10000

ENTRYPOINT ["dotnet", "KimberlinViado.Portfolio.dll"]
