# Kimberlin Viado — Portfolio

A responsive product-design portfolio built from the **MacBook Air–2** Figma design. The site includes featured projects, an illustrated about section, animated comic dialogue bubbles, collaborator labels, and testimonials.

## Technology

- .NET 8
- Blazor Server with interactive server components
- Razor, HTML, and CSS
- Docker deployment support

## Run locally

Requirements: [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)

```bash
dotnet restore
dotnet run --urls http://localhost:5187
```

Open `http://localhost:5187` in your browser.

## Build

```bash
dotnet build
```

Create a release package in `publish/`:

```bash
dotnet publish KimberlinViado.Portfolio.csproj --configuration Release --output publish
```

Run the published application:

```bash
dotnet publish/KimberlinViado.Portfolio.dll --urls http://localhost:5187
```

## Docker

```bash
docker build -t kimberlin-portfolio .
docker run --rm -p 10000:10000 kimberlin-portfolio
```

Open `http://localhost:10000`.

## Deploy to Render

This is a server-rendered Blazor application, so deploy it as a **Web Service**, not a Static Site.

1. Create a new Render Web Service from this repository.
2. Select **Docker** as the language/runtime.
3. Leave **Root Directory** blank.
4. Set **Dockerfile Path** to `./Dockerfile`.
5. Set the health-check path to `/`.
6. Deploy the latest commit from `main`.

The included `render.yaml` also supports Render Blueprint deployment.

## Project structure

```text
Components/
  Pages/Portfolio.razor    Main portfolio page
  App.razor                Document shell and fonts
wwwroot/
  assets/                  Local Figma image and SVG exports
  css/portfolio.css        Responsive styling and animations
Dockerfile                 Production container build
render.yaml                Render Web Service configuration
```

## Design

Figma: [Portfolio CV — MacBook Air–2](https://www.figma.com/design/qRo2SjTfPjgqy1dR95SjP9/Portfolio---CV?node-id=128-35)

The exported assets are stored locally so the site does not depend on temporary Figma asset URLs.
