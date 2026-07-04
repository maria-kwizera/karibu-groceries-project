Deployment checklist for Render and MongoDB Atlas

1) Commit & push

- Quick commit + push (Windows): run `scripts\push-render.bat` from repo root.
- Or run manually:

  git add render.yaml
  git commit -m "Add Render manifest"
  git push origin main

Note: replace `main` with your branch name if different.

2) Render environment variables (exact keys and example values)

- MONGODB_URI : mongodb+srv://<DB_USER>:<DB_PASSWORD>@<CLUSTER_HOST>/<DB_NAME>?retryWrites=true&w=majority
  - Example: mongodb+srv://kgluser:StrongP@ssw0rd@cluster0.abcd1.mongodb.net/kgl?retryWrites=true&w=majority
  - Use the full SRV string from Atlas. URL-encode special characters in the password.

- JWT_SECRET : a long random secret (recommended: 32+ characters)
  - Example: aZ8$kL9pQ1wE3rT6yU0iO7pZxC2vBn5m
  - Use a secrets generator; do NOT commit this to source.

- JWT_EXPIRES_IN : token lifetime
  - Example: 7d

- NODE_ENV : production
  - Example: production

- CORS_ORIGIN : frontend origin allowed for CORS
  - Example: https://kgl-frontend.onrender.com

- Optional fallback local URI:
  - MONGODB_URI_LOCAL : mongodb://localhost:27017/kgl

3) Atlas steps (networking & user)

- Create a database user
  - In Atlas → Database Access → Add New Database User
  - Choose a username (e.g., `kgluser`) and a strong password.
  - Assign minimum privileges needed (readWrite on the app DB).

- Network access / IP allowlist
  - For quick testing: add `0.0.0.0/0` (allows all IPs) — insecure for production.
  - For production: use one of:
    - Configure Atlas Private Endpoint / VPC Peering with Render (recommended).
    - Restrict to Render's outbound IPs (Render may use dynamic IPs; check Render docs).

- Connection string
  - Use the SRV connection string Atlas provides (starts with `mongodb+srv://`).
  - Replace `<username>`, `<password>`, and `<dbname>` as needed.
  - Ensure the password is URL encoded if it contains `@`, `:` or other special characters.

- TLS/SSL
  - Keep TLS enabled (Atlas requires TLS by default). No extra steps usually required.

- Test connection locally before deploying
  - From your machine, attempt to connect using `mongo` or a small Node script using the same `MONGODB_URI` value.

4) Render service settings

- Backend service
  - Root directory: `kgl-backend`
  - Environment: Node
  - Build command: `npm install`
  - Start command: `npm start`
  - Health check path: `/api/health`
  - Auto deploy: enabled (optional)

- Frontend static site
  - Root directory: `kgl-frontend`
  - Publish path: `.`
  - No build command (static files served)

5) Post-deploy verification

- Visit backend health endpoint:
  - https://<your-backend>.onrender.com/api/health
  - Expect JSON: { ok: true, service: "kgl-backend", ts: "..." }

- Inspect logs in Render for connection errors (Mongo auth, network, missing env vars).

- If the backend cannot connect to MongoDB, check Atlas network access and the correctness of `MONGODB_URI`.

6) Security notes

- Never commit `JWT_SECRET` or DB passwords to the repo.
- Prefer Atlas Private Endpoint / VPC peering or Render private networking for production.

If you want, I can:
- Run the commit + push commands locally if you give me terminal access (I don't have it), or
- Prepare a UI-ready checklist for you to follow in Render and Atlas step-by-step.
