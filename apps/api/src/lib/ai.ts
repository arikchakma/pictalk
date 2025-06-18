import { createOpenAI } from '@ai-sdk/openai';
import {
  generateText,
  experimental_generateSpeech as generateSpeech,
  type ImagePart,
} from 'ai';
import { HTTPException } from 'hono/http-exception';
import { config } from './config';

const openai_sdk = createOpenAI({
  apiKey: config.OPENAI_API_KEY,
});

export async function generateTextFromImage(
  image: ImagePart['image']
): Promise<string> {
  try {
    const { text } = await generateText({
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
    return text;
  } catch (error) {
    console.error(error);
    throw new HTTPException(500, {
      message: 'Failed to generate text from image',
    });
  }
}
