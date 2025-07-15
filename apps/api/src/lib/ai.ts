import { createOpenAI } from '@ai-sdk/openai';
import { type ImagePart, streamText } from 'ai';
import { HTTPException } from 'hono/http-exception';
import { config } from './config';

const openai_sdk = createOpenAI({
  apiKey: config.OPENAI_API_KEY,
});

export function streamTextFromImage(image: ImagePart['image']) {
  try {
    return streamText({
      model: openai_sdk.chat('gpt-4o-mini'),
      system:
        'You are great at describing images. You are given an image and you need to describe it in a way that is easy to understand for blind people. Keep the description short and concise. Do not include any other text than the description.',
      messages: [
        {
          role: 'user',
          content: [
            {
              type: 'image',
              image,
            },
          ],
        },
      ],
    });
  } catch (error) {
    console.error(error);
    throw new HTTPException(500, {
      message: 'Failed to generate text from image',
    });
  }
}

export const CHAT_RESPONSE_PREFIX = {
  message: '0',
  details: 'd',
} as const;

type ChatResponseType = keyof typeof CHAT_RESPONSE_PREFIX;

export function formatDataForStream(type: ChatResponseType, data: any) {
  const prefix = CHAT_RESPONSE_PREFIX[type];
  // we stringify the data to avoid the issue of the chunk being split into multiple lines
  // because the chunk is a stream of data and it is not guaranteed to be a single line
  return `${prefix}:${JSON.stringify(data)}\n`;
}
