# [RoomGPT](https://roomGPT.io) - redesign your room with AI

This is the previous and open source version of RoomGPT.io (a paid SaaS product). It's the very first version of roomGPT without the auth, payments, or additional features and it's simple to clone, deploy, and play around with.

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/Nutlope/roomGPT&env=REPLICATE_API_KEY&project-name=room-GPT&repo-name=roomGPT)

[![Room GPT](./public/screenshot.png)](https://roomGPT.io)

## How it works

It uses an ML model called [ControlNet](https://github.com/lllyasviel/ControlNet) to generate variations of rooms. This application gives you the ability to upload a photo of any room, which will send it through this ML Model using a Next.js API route, and return your generated room. The ML Model is hosted on [Replicate](https://replicate.com) and [Bytescale](https://www.bytescale.com/) is used for image storage.

## Running Locally

### Cloning the repository the local machine.

```bash
git clone https://github.com/Nutlope/roomGPT
```

### Creating a account on Replicate to get an API key.

1. Go to [Replicate](https://replicate.com/) to make an account.
2. Click on your profile picture in the top left corner, and click on "API Tokens".
3. Here you can find your API token. Copy it.

### Storing the API keys in .env

Create a file in root directory of project with env. And store your API key in it, as shown in the .example.env file.

If you'd also like to do rate limiting, create an account on UpStash, create a Redis database, and populate the two environment variables in `.env` as well. If you don't want to do rate limiting, you don't need to make any changes.

### Installing the dependencies.

```bash
npm install
```

### Running the application.

Then, run the application in the command line and it will be available at `http://localhost:3000`.

```bash
npm run dev
```

## One-Click Deploy

Deploy the example using [Vercel](https://vercel.com?utm_source=github&utm_medium=readme&utm_campaign=vercel-examples):

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/Nutlope/roomGPT&env=REPLICATE_API_KEY&project-name=room-GPT&repo-name=roomGPT)



### Testing ROOMGPT on  Docker



#### **1. Build Your production Build**

```
npm run build

> build
> next build

- info Creating an optimized production build  
- info Compiled successfully
- info Linting and checking validity of types  
- info Collecting page data  
[    ] - info Generating static pages (0/5)
- warn metadata.metadataBase is not set for resolving social open graph or twitter images, fallbacks to "http://localhost:3000". See https://nextjs.org/docs/app/api-reference/functions/generate-metadata#metadatabase




- warn metadata.metadataBase is not set for resolving social open graph or twitter images, fallbacks to "http://localhost:3000". See https://nextjs.org/docs/app/api-reference/functions/generate-metadata#metadatabase



- info Generating static pages (5/5)
- info Finalizing page optimization  

Route (app)                                Size     First Load JS
┌ ○ /                                      185 B          87.4 kB
├ ○ /dream                                 109 kB          196 kB
└ λ /generate                              0 B                0 B
+ First Load JS shared by all              77.4 kB
  ├ chunks/2443530c-572b24363cbae43f.js    50.6 kB
  ├ chunks/488-bb8ec137247bd86f.js         24.8 kB
  ├ chunks/main-app-d4c64d6d96bac48e.js    215 B
  └ chunks/webpack-11b1332dbdd47028.js     1.82 kB

Route (pages)                              Size     First Load JS
─ ○ /404                                   181 B          74.9 kB
+ First Load JS shared by all              74.7 kB
  ├ chunks/framework-8883d1e9be70c3da.js   45.1 kB
  ├ chunks/main-8b078dc4c5678e25.js        27.7 kB
  ├ chunks/pages/_app-b555d5e1eab47959.js  194 B
  └ chunks/webpack-11b1332dbdd47028.js     1.82 kB

λ  (Server)  server-side renders at runtime (uses getInitialProps or getServerSideProps)
○  (Static)  automatically rendered as static HTML (uses no initial props)
```

#### **2.Verify the .next Folder created at the root of the project**

```
.next
```
After running `npm run build` successfully, Next.js generates a `.next` directory in your project's root folder. This directory contains all the build artifacts necessary to run your application in production.

---

### **What to Look For After a Successful Build**

1. **`.next` Directory:**

   - **Location:** In the root directory of your project (where your `package.json` is located).
   - **Contents:** Compiled JavaScript files, optimized assets, and other build artifacts required for deployment.

2. **`standalone` Folder (Because of `output: 'standalone'`):**

   - **Path:** `.next/standalone`
   - **Contents:**
     - `server.js`: The entry point to start your application.
     - `node_modules`: A minimal set of Node.js modules required to run your application.
     - Any other necessary files for your application to function.

3. **`static` Folder:**

   - **Path:** `.next/static`
   - **Contents:** Optimized static assets like images, CSS, and JavaScript files.

---

### **How to Verify the Build Output**

#### **1. Check for the `.next` Directory**

In your project's root directory, list all files and folders:

```sh
ls -a
```

You should see the `.next` directory among the listed items.

#### **2. Inspect the Contents of the `.next` Directory**

Navigate into the `.next` directory:

```sh
cd .next
```

List its contents:

```sh
ls
```

You should see something like:

```
cache
server
standalone
static
BUILD_ID
```

#### **3. Examine the `standalone` Folder**

Since you have `output: 'standalone'` in your `next.config.js`, Next.js generates a `standalone` folder for optimized deployment.

Navigate into the `standalone` folder:

```sh
cd standalone
```

List its contents:

```sh
ls
```

You should see:

```
server.js
node_modules/
package.json
[next.config.js] (if present)
```

---

### **Understanding the Build Output**

- **`server.js`:** The main entry point to start your application. It contains the server code required to run your Next.js app.
- **`node_modules/`:** A minimal set of modules required to run your application in production. This is not the full `node_modules` from your development environment but only what's necessary.
- **`static/`:** Contains static assets optimized during the build process.
- **`BUILD_ID`:** A file containing the build identifier used by Next.js for caching and invalidation.

---

#### **3. Build Your Image from The Dockerfile**



#### **4. Install `sharp` in Your Project**

Ensure that `sharp` is installed as a dependency:

```sh
npm install sharp
```

- **Note:** Make sure `sharp` is listed under `"dependencies"` in your `package.json`, not `"devDependencies"`.

#### **5. Build Your Docker Image**

Run the following command to rebuild your Docker image:

```sh
docker build -t roomgpt .
```

#### **6. Run the Docker Container**

Start the container to test if the application runs without the `sharp` error:

```sh
docker run -p 3000:3000 roomgpt
```

#### **5. Test the Application**

- Access `http://localhost:3000` in your browser.
- Verify that the application starts correctly and that image optimization works as expected.

#### **7. Test the Application in the Container**

Run the container with placeholder values for the environment variables:

```sh
docker run -p 3000:3000 \
  -e REPLICATE_API_KEY=your_replicate_api_key \
  -e NEXT_PUBLIC_UPLOAD_API_KEY=your_upload_api_key \
  -e UPSTASH_REDIS_REST_URL=your_redis_url \
  -e UPSTASH_REDIS_REST_TOKEN=your_redis_token \
  roomgpt

```
## License

This repo is MIT licensed.
