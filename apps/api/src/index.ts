import 'dotenv/config';

import { serve } from '@hono/node-server';
import { Hono } from 'hono';
import { s3Client } from './lib/r2';
import { PutObjectCommand } from '@aws-sdk/client-s3';
import { getSignedUrl } from '@aws-sdk/s3-request-presigner';
import { config } from './lib/config';
import { zValidator } from '@hono/zod-validator';
import { z } from 'zod';
import path from 'node:path';
import { formatDataForStream, streamTextFromImage } from './lib/ai';
import { cors } from 'hono/cors';
import { openai } from './lib/openai';
import { stream, streamText } from 'hono/streaming';

const app = new Hono().use(
  cors({
    origin: ['http://localhost:5173'],
    allowHeaders: ['Content-Type', 'Authorization'],
    allowMethods: ['GET', 'POST', 'PATCH', 'PUT', 'DELETE', 'OPTIONS'],
    credentials: true,
    // it will cache the preflight request for 1 hour
    // so we don't need to send the preflight request for each request
    maxAge: 3600,
  })
);

app.post(
  '/signed-url',
  zValidator(
    'json',
    z.object({
      name: z.string().min(1),
      size: z.number().min(1),
      type: z.string().min(1),
    })
  ),
  async (c) => {
    const { name, size, type } = c.req.valid('json');

    const randomId = crypto.randomUUID();
    const ext = path.extname(name);
    const date = new Date().toISOString().split('T')[0]; // YYYY-MM-DD
    const key = `i/${date}/${randomId}${ext}`;

    const command = new PutObjectCommand({
      Bucket: config.S3_BUCKET_NAME,
      Key: key,
      ContentType: type,
      ContentLength: size,
    });

    const url = await getSignedUrl(s3Client, command, {
      expiresIn: 60 * 2, // 2 minutes
    });

    return c.json({
      url,
      key,
    });
  }
);

app.post(
  '/describe',
  zValidator(
    'json',
    z.object({
      imageKey: z.string().min(1),
    })
  ),
  async (c) => {
    const { imageKey } = c.req.valid('json');
    const imageUrl = `https://cdn.arikko.dev/${imageKey}`;
    const result = streamTextFromImage(imageUrl);

    return streamText(c, async (stream) => {
      for await (const chunk of result.textStream) {
        stream.write(formatDataForStream('message', chunk));
      }
    });
  }
);

app.post(
  '/speak',
  zValidator(
    'query',
    z.object({
      text: z.string().min(1),
    })
  ),
  async (c) => {
    const { text } = c.req.valid('query');
    const response = await openai.audio.speech.create({
      model: 'gpt-4o-mini-tts',
      voice: 'sage',
      input: text,
      instructions:
        'Speak in a cheerful and positive tone. Speak in a way that is easy to understand for blind people.',
      response_format: 'wav',
    });

    return new Response(response.body, {
      headers: {
        'Content-Type': 'audio/wav',
        'Content-Disposition': 'attachment; filename="audio.wav"',
        'Cache-Control': 'no-cache',
      },
    });
  }
);

serve(
  {
    fetch: app.fetch,
    port: 8080,
  },
  (info) => {
    console.log(`Server is running on http://localhost:${info.port}`);
  }
);
