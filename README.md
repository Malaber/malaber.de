# malaber.de — 404

Minimal static full-screen page served by Nginx. The site displays the existing [4041.jpg](4041.jpg) edge-to-edge, with a custom neon-eye favicon and browser title `404`.

The image fills the browser window using CSS `object-fit: cover` (cropping edges on screens with a different aspect ratio). Unknown paths also display this page, while correctly returning HTTP 404.

## Local build

```sh
docker build -t malaber-404 .
docker run --rm -p 8080:80 malaber-404
```

Open http://localhost:8080.

## GitHub Actions / GHCR

Pull requests to `main` run a Docker build without publishing.

Every push to `main` builds and publishes:

- `ghcr.io/malaber/malaber.de:latest`
- `ghcr.io/malaber/malaber.de:sha-<commit>`

The workflow uses the built-in `GITHUB_TOKEN` (no additional secret required). GitHub Actions must have permission to publish packages. To pull the image without authenticating, make its GHCR package **Public** after the first successful publish.

## Deployment

```sh
docker compose pull
docker compose up -d
```

The included [compose.yaml](compose.yaml) publishes Nginx on host port 8080. Point your reverse proxy at port 8080, or adapt the port/Traefik labels as needed.

The original `4041.jpg` stays at the repository root and is bundled into the image as-is.
