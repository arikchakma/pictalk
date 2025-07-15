import 'dotenv/config';

import { serve } from '@hono/node-server';
import { Hono } from 'hono';
import { zValidator } from '@hono/zod-validator';
import { z } from 'zod';
import { formatDataForStream, streamTextFromImage } from './lib/ai';
import { cors } from 'hono/cors';
import { openai } from './lib/openai';
import { streamText } from 'hono/streaming';

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
  '/describe',
  zValidator(
    'form',
    z.object({
      image: z.instanceof(File),
    })
  ),
  async (c) => {
    const { image } = c.req.valid('form');
    const arrayBuffer = await image.arrayBuffer();

    const result = streamTextFromImage(arrayBuffer);

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
