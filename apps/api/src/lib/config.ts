import { z } from 'zod';

const envVariables = z.object({
  OPENAI_API_KEY: z.string(),
});

export const config = envVariables.parse(process.env);

declare global {
  namespace NodeJS {
    interface ProcessEnv extends z.infer<typeof envVariables> {}
  }
}
