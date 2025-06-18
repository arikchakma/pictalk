import { PlusIcon } from 'lucide-react';
import type { Route } from './+types/_index';
import {
  useDropzone,
  type DropEvent,
  type FileRejection,
} from 'react-dropzone';
import { cn } from '~/utils/classname';
import { useCallback, useEffect, useRef, useState } from 'react';
import { httpPost } from '~/utils/http';

export function meta({}: Route.MetaArgs) {
  return [
    { title: 'PicTalk AI' },
    { name: 'description', content: 'PicTalk AI' },
  ];
}

type OnDrop<T extends File = File> = (
  acceptedFiles: T[],
  fileRejections: FileRejection[],
  event: DropEvent
) => void;

export default function IndexPage() {
  const [file, setFile] = useState<File | null>(null);
  const [isLoading, setIsLoading] = useState(false);

  const [audioLoading, setAudioLoading] = useState(false);
  const [audioLoaded, setAudioLoaded] = useState(false);
  const [isPlaying, setIsPlaying] = useState(false);

  const audioRef = useRef<HTMLAudioElement | null>(null);
  const audioContextRef = useRef<AudioContext | null>(null);

  const onDrop: OnDrop = useCallback((acceptedFiles) => {
    const firstFile = acceptedFiles[0];
    setFile(firstFile);
  }, []);

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    accept: {
      'image/*': ['.jpg', '.jpeg', '.png', '.heic', '.heif'],
    },
  });

  useEffect(() => {
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker
        .register('/worker.js')
        .catch((err) => console.error('SW registration failed', err));
    }
  }, []);

  const handleSubmit = useCallback(
    async (e: React.FormEvent<HTMLFormElement>) => {
      e.preventDefault();

      if (!file || audioLoading) {
        return;
      }

      if (audioRef.current) {
        if (isPlaying) {
          audioRef.current.pause();
          setIsPlaying(false);
          setAudioLoaded(false);
          audioRef.current = null;
        }
      }

      setAudioLoading(true);
      setAudioLoaded(false);
      setIsPlaying(false);

      const { url: presignedUrl, key } = await getPresignedDetails(
        file.name,
        file.type,
        file.size
      );
      await fetch(presignedUrl, {
        method: 'PUT',
        headers: {
          'Content-Type': file.type,
        },
        body: file,
      });

      const url = new URL('/speak', import.meta.env.VITE_API_URL);
      url.searchParams.append('imageKey', key);
      const audioUrl = url.toString();

      const audio = new Audio();
      audio.preload = 'none';
      audioRef.current = audio;

      audio.onerror = () => {
        setAudioLoading(false);
        setAudioLoaded(false);
        setIsPlaying(false);
        alert('Error generating audio');
      };

      audio.onplay = () => {
        setIsPlaying(true);
        setAudioLoaded(true);
        setAudioLoading(false);
      };

      audio.onpause = () => {
        setIsPlaying(false);
      };
      audio.onended = () => {
        setIsPlaying(false);
      };

      audio.autoplay = true;
      audio.src = audioUrl;
    },
    [file]
  );

  return (
    <form
      className="mx-auto mt-10 flex max-w-md flex-col"
      onSubmit={handleSubmit}
    >
      <h2 className="text-center text-3xl">Describe an image</h2>
      <p className="mt-2 text-balance text-center text-sm text-zinc-500">
        Upload an image and let the image describe itself.
      </p>

      <div
        {...getRootProps({
          className: cn(
            'border-[1.5px] border-dashed border-zinc-200 min-h-60 flex items-center justify-center rounded-xl p-4 mt-8 bg-zinc-50',
            isDragActive && 'border-zinc-400'
          ),
        })}
      >
        <input {...getInputProps()} />
        <div className="max-w-2xs mx-auto flex flex-col items-center text-balance text-center">
          <PlusIcon className="size-5 text-zinc-400" />
          <p className="mt-3 text-zinc-500">
            Drag and drop your files here or{' '}
            <span className="text-black">click to browse</span>
          </p>
        </div>
      </div>

      <p className="mt-2 text-center text-xs text-zinc-400">
        Only image files are supported at the moment
      </p>

      <button
        type="submit"
        className="mt-4 flex w-full cursor-pointer items-center justify-center rounded-xl bg-zinc-100 p-1 py-2.5 leading-none tracking-wide text-zinc-600 transition-colors hover:bg-zinc-200 disabled:cursor-not-allowed disabled:text-zinc-400 data-[loading=true]:cursor-wait"
      >
        Describe Image
      </button>
    </form>
  );
}

type PresignedDetails = {
  url: string;
  key: string;
};

async function getPresignedDetails(
  name: string,
  type: string,
  size: number
): Promise<PresignedDetails> {
  return httpPost<PresignedDetails>('/images/signed-url', {
    name,
    size,
    type,
  });
}
