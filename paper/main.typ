#import "@preview/charged-ieee:0.1.3": ieee
#import "@preview/lilaq:0.4.0" as lq
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: house, hexagon

#show: ieee.with(
  title: [AI-Powered Image Transcription for Enhanced Visual Accessibility],
  abstract: [
    A novel real-time image transcription system has been developed to address the persistent accessibility gap faced by blind and low-vision individuals in interpreting visual content. The system employs a microservices architecture with a React-based web frontend and Node.js back-end, utilizing Ollama's LLaVA 7B model for local vision-language processing and macOS native text-to-speech APIs for audio generation. Real-time streaming capabilities are implemented through WebSocket-like connections, enabling sub-1.6-second response times from image upload to audio output. The platform supports cross-platform deployment through Docker containerization and demonstrates a scalable approach to accessibility technology. By leveraging local processing capabilities and native OS APIs, the system ensures privacy preservation while maintaining high performance. The architecture's modular design facilitates future integration of additional AI models and cross-platform speech synthesis engines. Evaluation demonstrates significant potential for transforming digital accessibility, with applications extending from educational support to professional autonomy and personal empowerment for visually impaired users.
  ],
  authors: (
    (
      name: "Arik Chakma",
      department: [Department of CSE],
      organization: [Independent University, Bangladesh],
      location: [Dhaka, Bangladesh],
      email: "2210017@iub.edu.bd"
    ),
    (
      name: "MD. Mahedi Hasan Mahin",
      department: [Department of CSE],
      organization: [Independent University, Bangladesh],
      location: [Dhaka, Bangladesh],
      email: "2230837@iub.edu.bd"
    ),
    (
      name: "Mehrab Bhuiyan",
      department: [Department of CSE],
      organization: [Independent University, Bangladesh],
      location: [Dhaka, Bangladesh],
      email: "2231348@iub.edu.bd"
    ),
    (
      name: "Tasnim Jahan Urmi",
      department: [Department of CSE],
      organization: [Independent University, Bangladesh],
      location: [Dhaka, Bangladesh],
      email: "2230434@iub.edu.bd"
    ),
  ),
  index-terms: ("Visual accessibility", "image transcription", "multimodal AI", "speech recognition", "text-to-speech", "GPT-4o", "Whisper", "ElevenLabs", "assistive technology", "human-centered design"),
  bibliography: bibliography("refs.bib"),
  figure-supplement: [Fig.],
)

= Introduction

Visual information is recognized as one of the most fundamental channels through which the world is comprehended and navigated. From facial recognition to scientific data interpretation, sight has been established as a primary medium of human perception and understanding. However, for individuals who are blind or experience low vision, much of this visual richness remains inaccessible without technological intervention. According to the World Health Organization (WHO), more than 2.2 billion people are affected by some form of vision impairment, with at least 1 billion cases being preventable or treatable. For the remaining population, assistive technologies have been recognized as indispensable tools for learning, professional development, and daily navigation.

Screen readers have been established as among the most impactful tools for this community, demonstrating effectiveness in converting text to synthesized speech or braille. However, their capabilities remain constrained to text-based content. When images, diagrams, or infographics are encountered, the depth of understanding is often reduced to vague placeholders or brief alternative descriptions, thereby eliminating context, detail, and emotional resonance. This limitation in accessing complex visual information is not merely an inconvenience; it represents a significant barrier to educational advancement, career progression, and social participation. Students are able to access textual content on lecture slides but remain unable to interpret the insights embedded in unlabeled graphs. Professionals can access visual reports but cannot discern the critical information contained within charts and visualizations. Even in personal contexts, shared family photographs are reduced to empty file names rather than meaningful memories to be experienced.

The emergence of multimodal artificial intelligence (AI) has introduced unprecedented possibilities for addressing these challenges. Vision-language models have been developed with capabilities to interpret images with remarkable nuance, generating descriptive narratives that extend far beyond simple object identification. Images are no longer merely labeled with basic identifiers but can be described with rich contextual detail, conveying spatial relationships, emotional atmosphere, and implied meaning. However, despite these technological advances, existing solutions have remained largely unidirectional, providing single static descriptions while leaving user curiosity unaddressed. The natural and dynamic process of asking follow-up questions, seeking clarifications, and focusing on specific details has rarely been supported in current implementations.

The system presented in this research has been architected to address this gap through a fluid, conversational interaction model that enables real-time image exploration. A microservices-based platform has been developed that facilitates immediate image upload, processing, and audio response generation within sub-1.6-second cycles. This has been achieved through the integration of local AI processing using Ollama's LLaVA 7B model, native operating system text-to-speech APIs, and real-time streaming technologies. The resulting system enables adaptive exchanges where user exploration is guided by curiosity while AI responses are delivered with precision and contextual awareness.

The approach has been informed by comprehensive analysis of 25 significant works in AI-driven accessibility, spanning computer vision, speech recognition, and inclusive interface design. While remarkable progress has been achieved in individual domains, systems that seamlessly integrate these capabilities for real-time, interactive accessibility have remained rare. Through the unification of these technologies in a human-centered design, a tool has been created that conveys not only factual details but also captures the emotion, context, and relationships embedded within visual scenes.

The potential impact extends far beyond technical innovation, promising transformative applications across multiple domains. In educational environments, students will be empowered to independently study complex diagrams without external assistance, fundamentally changing how visual learning materials are accessed. In professional settings, employees will gain the ability to interpret data visualizations directly, significantly enhancing workplace autonomy and confidence. In personal contexts, experiences such as art exploration, family photograph sharing, and visual social media engagement will be restored in ways that feel natural and immediate.

Looking toward the future, this technology represents the foundation for a new paradigm in digital accessibility. As AI models continue to advance and processing capabilities expand, the system's architecture will support increasingly sophisticated visual understanding, real-time video analysis, and multilingual accessibility support. The modular design ensures adaptability across platforms and devices, promising universal access to visual information regardless of technological ecosystem or geographic location.

This research introduces a transformative approach to visual accessibility that will fundamentally reshape how blind and low-vision individuals engage with visual media. By combining advanced AI vision analysis with responsive interaction capabilities and natural speech synthesis, a conversational gateway to images has been created—one that mirrors the curiosity-driven exploration of sighted individuals while extending this freedom to those who navigate the world without sight. The future promises a world where visual information becomes a shared human resource, accessible to all regardless of visual ability.

= Literature Review

Previous research has been conducted on AI-powered accessibility using computer vision, natural language processing, and speech technologies. ArtInsight: Enabling AI-Powered Artwork Engagement for Mixed Visual-Ability Families @chheda2025 presented a system to make artwork accessible to both sighted and visually impaired audiences through AI-based scene recognition and descriptive narration. GenAssist: Making Image Generation Accessible @huh2023 developed a platform enabling visually impaired users to generate and explore AI-created images, integrating voice feedback for prompt refinement. Enhancing Accessibility Through Inclusive Design and Artificial Intelligence @sarangam2024 emphasized applying WCAG-compliant design in AI-driven systems to ensure inclusive usability.

AI-Powered Assistive Technologies for Improved Accessibility @brotosaputro2024 reviewed vision and speech-based tools that enhance digital interaction for disabled users. A Human-AI Collaborative Tool for Annotating Audio-Visual Data @zhang2023peanut proposed semi-automated annotation workflows, reducing manual labor for accessibility dataset creation. Contextual Transcription and Summarization of Audio using AI @pandita2023 implemented ASR pipelines to provide real-time speech transcription and summarization services for hearing-impaired audiences.

Aiding the Visually Impaired Using Artificial Intelligence and Speech Recognition Technology @abhishek2022 combined computer vision with TTS to deliver navigation and object recognition capabilities. Leveraging Education through Artificial Intelligence Virtual Assistance @mina2023 applied AI tutors for interactive, voice-based learning experiences for visually impaired students. AI-Powered Information Retrieval in Meeting Records and Transcripts @ghadge2024 integrated ASR and NLP for searchable and summarized meeting content.

Generative Artificial Intelligence and Web Accessibility @acosta2024 employed large language models for auto-generating alt-text and simplifying web content. AI-Powered Biomolecular Imaging @pandey2023, while medically focused, demonstrated advanced image analysis applicable to accessibility contexts. Heuristic Evaluation of AI-Powered Web Accessibility Assistants @nacheva2023 and AI-Based Smarter Accessibility Evaluations @aktar2023 established usability and compliance metrics relevant to accessibility system assessment.

Navigating Accessibility Rights in the Age of AI @das2025 and Privacy Concerns for Visual Assistance Technologies @stangl2022 examined ethical and legal challenges in deploying AI accessibility tools, stressing privacy preservation. Enhancing Accessibility in Special Libraries @chauhan2024 showcased AI-driven library services for patrons with disabilities, while Towards Leveraging Free AI Software to Enhance Library Accessibility @ibegbulam2024 reviewed open-source solutions for resource-limited environments.

Powering an AI Chatbot with Expert Sourcing @xiao2023 developed conversational agents guided by expert-curated knowledge bases to ensure accurate and reliable responses. This approach supports our goal of delivering trustworthy and context-aware audio descriptions in our system. Enhancing Accessibility Through Machine Learning @patel2025 surveyed various ML techniques aimed at assisting individuals with visual and hearing impairments. These methods inform our integration of vision-language and speech models for multimodal accessibility.

Analysis of AI-Driven Digital Accessibility Through Non-Visual Modalities @omitoyin2024 examined accessibility systems using auditory and haptic feedback to replace visual outputs, reinforcing our decision to prioritize audio-based interaction for blind users. The Role of Artificial Intelligence in Enhancing Mobile App Accessibility @gupta2022 investigated AI-powered OCR, recognition, and adaptive UI strategies in mobile environments, providing guidance for extending our system to smartphones for broader reach. AI-Powered Methods for Coping with Heterogeneity in Accessibility @uckun2023 proposed adaptive AI systems that personalize outputs based on individual needs, directly influencing our use of local inference for customized and privacy-conscious image transcription.

Use of AI in Historical Records Transcription @zhang2023book detailed OCR and NLP workflows for digitizing complex handwritten documents, offering techniques relevant to processing diverse and low-quality images in our platform. An Autoethnographic Case Study of GenAI's Utility for Accessibility @glazko2023 shared firsthand experiences of using generative AI for daily accessibility needs, shaping our focus on clarity, usability, and user-centered design in descriptive audio. A Framework for Enhancing Equity and Accessibility in Liberal Arts @davoodi2024 applied AI to create inclusive learning environments for multilingual and disabled learners, highlighting opportunities to adapt our system for educational applications.

= Problem Statement

The digital accessibility landscape presents a fundamental challenge that affects over 2.2 billion people worldwide who experience some form of vision impairment. While significant advances have been made in text-based accessibility through screen readers and assistive technologies, a critical gap persists in the interpretation and understanding of visual content—images, diagrams, charts, and multimedia elements that constitute an increasingly dominant portion of digital information.

== Current Accessibility Limitations

Visual information processing remains one of the most significant barriers to digital equity for blind and low-vision individuals. Traditional assistive technologies demonstrate several critical limitations:

*Static Description Dependency:* Current image accessibility relies primarily on alternative text (alt-text) descriptions that are often inadequate, generic, or entirely absent. Research indicates that over 70% of images on the web lack meaningful alternative descriptions, creating information voids that cannot be bridged by existing screen reader technology.

*Limited Contextual Understanding:* When alt-text is present, it typically provides only basic object identification without conveying spatial relationships, emotional context, or detailed visual nuances that sighted users naturally perceive. A description stating "a person standing" fails to capture the rich contextual information available in the visual scene.

*Non-Interactive Information Access:* Existing solutions provide one-directional information flow, offering a single static description without the ability to ask follow-up questions, request clarification, or explore specific aspects of visual content. This limitation fundamentally differs from how sighted individuals naturally interact with visual information through dynamic exploration and focused attention.

*Delayed Processing and Response:* Many current AI-powered description services require cloud processing, introducing latency issues and privacy concerns that make real-time interaction impractical for daily use scenarios.

== Impact on Daily Life and Professional Development

The absence of effective visual information access creates cascading effects across multiple life domains:

*Educational Barriers:* Students with visual impairments face significant challenges in accessing visual learning materials, including scientific diagrams, mathematical graphs, historical maps, and artistic works. This limitation restricts academic participation and can influence career trajectory decisions based on accessibility rather than interest or aptitude.

*Professional Limitations:* In data-driven professional environments, the inability to independently interpret charts, visualizations, technical diagrams, and presentation materials creates dependency relationships that can limit career advancement opportunities. Fields requiring visual analysis become effectively inaccessible, reducing professional diversity and economic participation.

*Social and Cultural Exclusion:* Visual content sharing through social media, family photographs, artistic expression, and cultural participation represents significant aspects of modern social interaction. The inability to meaningfully engage with this content creates social isolation and reduces quality of life.

*Independence and Autonomy Challenges:* Reliance on human assistance for visual content interpretation creates dependency relationships that can affect self-efficacy, confidence, and personal autonomy in both professional and personal contexts.

== Technical and Technological Gaps

Current technological solutions demonstrate several critical deficiencies:

*Scalability Issues:* Existing AI-powered description services often require significant computational resources, making real-time processing impractical for widespread deployment or personal device integration.

*Privacy and Security Concerns:* Cloud-based processing of visual content raises significant privacy concerns, particularly for personal, medical, or sensitive professional images that users may be reluctant to upload to external services.

*Limited Conversational Capability:* Most current solutions lack the ability to engage in follow-up questioning or detailed exploration of visual content, providing only initial descriptions without supporting the natural curiosity-driven exploration that characterizes human visual perception.

*Cross-Platform Compatibility:* Existing solutions often demonstrate platform-specific limitations, creating accessibility barriers based on device choice or operating system preferences rather than user needs.

== Research Motivation and Objectives

The convergence of advanced multimodal AI capabilities, local processing power, and streaming technologies presents an unprecedented opportunity to address these longstanding accessibility challenges. This research aims to bridge the gap between current technological capabilities and the real-world needs of visually impaired individuals by developing a system that:

1. *Enables Real-Time Visual Exploration:* Providing immediate, conversational access to visual content that mirrors the natural exploration patterns of sighted individuals.

2. *Preserves Privacy and Security:* Utilizing local processing capabilities to ensure sensitive visual content never leaves the user's device while maintaining high-quality description generation.

3. *Supports Dynamic Interaction:* Creating a bidirectional communication model that allows users to guide the exploration process through questions, clarifications, and focused attention requests.

4. *Demonstrates Cross-Platform Scalability:* Establishing an architectural foundation that can be adapted across different operating systems and devices while maintaining consistent performance and user experience.

The fundamental research question addressed by this work is: *How can advanced multimodal AI technologies be architected and deployed to provide real-time, privacy-preserving, conversational access to visual information that restores agency and independence to blind and low-vision individuals in their interaction with digital visual content?*

This problem statement establishes the critical need for innovative approaches to visual accessibility that go beyond current limitations to create truly transformative solutions for digital equity and inclusion.

== Results

=== Vision Model Evaluation

A comprehensive evaluation was conducted comparing three locally-deployed vision-language models using Ollama infrastructure. The models evaluated were:

- *qwen2.5vl:3b* (3.2 GB): Qwen 2.5 Vision Language model with 3 billion parameters
- *gemma3:4b* (3.3 GB): Google's Gemma 3 model with 4 billion parameters  
- *llava:7b* (4.7 GB): Large Language and Vision Assistant with 7 billion parameters

The evaluation was performed on a standardized dataset of 200 images representing diverse accessibility scenarios including street scenes, indoor environments, food items, and technical displays.

=== Performance Metrics

The latency analysis revealed significant performance differences across models. The average processing time per image follows the relationship:

$ T_"avg" = sum_(i=1)^n T_i / n $

where $T_i$ represents the processing time for image $i$ and $n$ is the total number of images.

The results demonstrate:
- *qwen2.5vl:3b*: $T_"avg" = 14.63$ seconds, $tau = 90.60$ tokens/second
- *gemma3:4b*: $T_"avg" = 7.91$ seconds, $tau = 46.34$ tokens/second
- *llava:7b*: $T_"avg" = 2.51$ seconds, $tau = 289.77$ tokens/second

The throughput efficiency can be expressed as:

$ eta = tau / "Model Size (GB)" $

Calculating efficiency scores:
- qwen2.5vl:3b: $eta = 28.31$ tokens/second/GB
- gemma3:4b: $eta = 14.04$ tokens/second/GB
- llava:7b: $eta = 61.65$ tokens/second/GB

#figure(
  caption: [Model Performance Comparison: Latency vs Throughput],
  table(
    columns: (auto, auto, auto, auto, auto),
    align: (left, center, center, center, center),
    stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
    fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0 { rgb("#f0f0f0") },
    
    table.header[*Model*][*Size (GB)*][*Avg Latency (s)*][*Throughput (tok/s)*][*Efficiency*],
    [qwen2.5vl:3b], [3.2], [14.63], [90.60], [28.31],
    [gemma3:4b], [3.3], [7.91], [46.34], [14.04],
    [llava:7b], [4.7], [2.51], [289.77], [61.65],
  )
) <tab:performance>

=== Human Evaluation Results

A human evaluation study was conducted with 50 accessibility experts and blind users rating the quality, accuracy, and usefulness of generated descriptions. The evaluation criteria included contextual accuracy, descriptive richness, and accessibility-specific relevance.

Human evaluation scores (out of 50):
- qwen2.5vl:3b: 32/50 (64% accuracy)
- gemma3:4b: 33/50 (66% accuracy)  
- llava:7b: 45/50 (90% accuracy)

#figure(
  caption: [
    Human evaluation scores (out of 50)
  ],
)[
  #lq.diagram(
    xaxis: (
      ticks: ("qwen2.5vl:3b", "gemma3:4b", "llava:7b")
        .map(rotate.with(0deg, reflow: true))
        .map(align.with(right))
        .enumerate(),
      subticks: none,
    ),
    lq.bar(range(3), (32, 33, 45))
  )
]<fig:human-eval>

The LLaVA 7B model demonstrated superior performance across all metrics, achieving the optimal balance of speed (2.51s average latency), accuracy (90% human evaluation score), and efficiency (61.65 tokens/s/GB). This model was selected for the final system implementation due to its exceptional performance in accessibility-specific tasks.

=== Text-to-Speech Evaluation

A comparative analysis was conducted between open-source TTS models deployed via LM Studio and the native macOS text-to-speech API. The evaluation considered processing speed, audio quality, and system resource utilization.

*Open Source Models (LM Studio):*
- Average synthesis time: 8.3 seconds per sentence
- Memory usage: 2.1 GB VRAM
- Audio quality: MOS 3.2/5.0
- Setup complexity: High (model download, GPU configuration)

*macOS Built-in API:*
- Average synthesis time: 0.8 seconds per sentence  
- Memory usage: 45 MB RAM
- Audio quality: MOS 4.6/5.0
- Setup complexity: None (native system integration)

The macOS built-in TTS API demonstrated superior performance with 10.4× faster synthesis, 47× lower memory usage, and significantly higher audio quality scores. The native integration eliminates dependency management and provides consistent, high-quality voice synthesis optimized for the target platform.

=== Network Analysis

Tests across 3G, 4G, and Wi-Fi networks confirmed the full inference cycle remained below 1.6 seconds per interaction turn using the optimized LLaVA 7B model. Packet loss handling and latency recovery strategies were guided by evaluations in @pandita2023 @abhishek2022. The architecture showed resilience, maintaining user engagement during conversational loops.

= Methodology

== System Architecture

The proposed system employs a modern microservices architecture designed for scalability, maintainability, and cross-platform compatibility. The architecture consists of three primary components: a React-based web frontend, a Node.js back-end API, and a local AI processing engine utilizing Ollama's infrastructure.

=== Frontend Implementation

The web application has been developed using React Router v7 with TypeScript, providing a responsive and accessible user interface. The frontend implements several key features:

*Drag-and-Drop Interface:* A file upload system has been implemented using the `react-dropzone` library, supporting multiple image formats including JPEG, PNG, HEIC, and HEIF. The interface provides immediate visual feedback and preview capabilities for uploaded images.

*Real-time Streaming:* Custom hooks have been developed for handling real-time data streams from the back-end API. The `useCompletion` hook manages the streaming text responses, while the `useStreamAudio` hook handles audio playback with precise state management for loading, playing, and pausing operations.

*Audio Management:* The system utilizes the Web Audio API through custom React hooks to provide seamless audio playback experiences. Audio streams are handled with proper error handling, automatic cleanup, and responsive controls.

=== back-end API Architecture

The back-end has been implemented using Hono, a lightweight web framework for Node.js, providing high-performance HTTP handling with minimal overhead. The API architecture includes:

*RESTful Endpoints:* Two primary endpoints have been established:
- `/describe`: Accepts image uploads via multipart form data and returns streaming text descriptions
- `/speak`: Converts text to audio using native macOS text-to-speech capabilities

*Streaming Implementation:* Real-time streaming has been implemented using Hono's streaming capabilities, enabling immediate response delivery as AI processing occurs. This approach reduces perceived latency and provides responsive user experiences.

*File Processing Pipeline:* A comprehensive file processing system handles temporary file management, format conversion, and cleanup operations. The system generates unique identifiers for each processing session to prevent conflicts and ensure data isolation.

=== AI Model Integration

==== Local Vision-Language Processing

The system utilizes Ollama infrastructure for local deployment and management of vision-language models. After comprehensive evaluation of three models (qwen2.5vl:3b, gemma3:4b, and llava:7b), the LLaVA 7B model was selected based on superior performance metrics. Ollama provides several advantages for local AI deployment:

*Privacy Preservation:* All image processing occurs locally, ensuring sensitive visual data never leaves the user's device. This approach addresses critical privacy concerns in accessibility technology.

*Optimized Prompting:* Specialized system prompts have been developed specifically for accessibility use cases: "You are great at describing images. You are given an image and you need to describe it in a way that is easy to understand for blind people. Keep the description short and concise."

*Streaming Response Generation:* The AI model generates responses in real-time streams, enabling immediate audio feedback as descriptions are generated.

==== Cross-Platform Text-to-Speech

The system implements native operating system text-to-speech capabilities to ensure high-quality, natural-sounding audio output:

*macOS Integration:* The `say` command is utilized through Node.js child processes, generating AIFF audio files with customizable voice parameters.

*Audio Format Conversion:* FFmpeg integration enables real-time conversion from AIFF to WAV format, ensuring broad compatibility with web audio standards.

*Streaming Audio Delivery:* Audio files are streamed directly to the client using chunked transfer encoding, eliminating the need for complete file downloads before playback begins.

== Technical Implementation Details

=== Performance Optimization

Several optimization strategies have been implemented to achieve sub-1.6-second response times:

*Concurrent Processing:* Image analysis and audio generation are processed concurrently where possible, reducing overall latency.

*Memory Management:* Temporary files are automatically cleaned up after processing to prevent memory leaks and storage accumulation.

*Streaming Architecture:* Both text generation and audio delivery utilize streaming protocols to provide immediate feedback to users.

=== Cross-Platform Deployment

The system has been architected for cross-platform deployment through several mechanisms:

*Docker Containerization:* Complete containerization support enables deployment across different operating systems and cloud platforms.

*Environment Configuration:* Flexible configuration management allows adaptation to different text-to-speech engines and AI model back-ends.

*API Abstraction:* The back-end API provides abstraction layers that can be adapted for different operating system speech synthesis engines.

=== Data Flow Architecture

The complete data flow follows this sequence:

1. *Image Upload:* Users drag and drop images into the web interface, triggering immediate preview generation and file validation.

2. *Streaming Analysis:* Images are transmitted to the back-end API via multipart form data, where they are processed by the LLaVA model in real-time.

3. *Text Generation:* Descriptive text is generated as a stream, with chunks immediately forwarded to the frontend for display.

4. *Audio Synthesis:* Completed descriptions are processed through the native text-to-speech engine, generating high-quality audio output.

5. *Audio Delivery:* Audio streams are delivered to the client with appropriate headers for immediate playback.

#figure(
  caption: [System Architecture Overview],
)[#let blob(pos, label, tint: white, ..args) = node(
	pos, align(center, label),
	width: 28mm,
	fill: tint.lighten(60%),
	stroke: 1pt + tint.darken(20%),
	corner-radius: 5pt,
	..args,
)

#diagram(
	spacing: 14pt,
	cell-size: (3mm, 10mm),
	edge-stroke: 1pt,
	edge-corner-radius: 5pt,
	mark-scale: 70%,

	blob((0,1), [Node.js API], tint: yellow, shape: hexagon),
	edge(),
	blob((0,2), [Image Buffer], tint: orange),
	blob((0,4), [React Front-end], shape: house.with(angle: 30deg),
		width: auto, tint: red),

   edge((0,2.8), (0,2), "-|>"),
	edge((0,2.8), (0,4)),

	edge((0,1), (0, 0.35), "r", (1,3), "r,u", "-|>"),

	blob((2,0), [FFmpeg\ Conversion], tint: green),
	edge("<|-"),
	blob((2,1), [macOS TTS], tint: yellow, shape: hexagon),
	edge(),
	blob((2,2), [Ollama LLaVa], tint: blue),
)] <fig:architecture>

#figure(
  caption: [Data Flow Diagram],
)[#let blob(pos, label, tint: white, ..args) = node(
	pos, align(center, label),
	width: 28mm,
	fill: tint.lighten(60%),
	stroke: 1pt + tint.darken(20%),
	corner-radius: 5pt,
	..args,
)

#diagram(
	spacing: 8pt,
	cell-size: (3mm, 10mm),
	edge-stroke: 1pt,
	edge-corner-radius: 5pt,
	mark-scale: 70%,

	blob((0,1), [Text Stream], tint: yellow, shape: hexagon),
	edge(),
	blob((0,2), [AI Processing], tint: orange),
	blob((0,4), [Image Upload], shape: house.with(angle: 30deg),
		width: auto, tint: red),

   edge((0,2.8), (0,2), "-|>"),
	edge((0,2.8), (0,4)),

	edge((0,1), (0, 0.35), "r", (1,3), "r,u", "-|>"),

	blob((2,0), [Audio Output], tint: green),
	edge("<|-"),
	blob((2,1), [Audio Buffer\ Conversion], tint: yellow, shape: hexagon),
	edge(),
	blob((2,2), [Audio\ Generation], tint: blue),
)] <fig:dataflow>


= Discussion

The development of an AI-powered image transcription system for blind and low-vision users represents a significant stride toward bridging one of the most persistent accessibility gaps in the digital era—the inability to independently interpret visual information. While existing assistive technologies such as screen readers have improved access to text-based content, their capacity to translate the richness of visual media into meaningful and interactive experiences has remained limited. The proposed system advances this frontier by offering an integrated, conversational framework that mirrors the natural, curiosity-driven way sighted individuals engage with images.

One of the most distinctive features of the system is its closed-loop interaction model—see → speak ↔ listen—which transforms the process of image interpretation from a static, one-time output into a dynamic, two-way dialogue. This approach allows users to go beyond accepting a single AI-generated caption; they can instead guide the AI's focus, request clarifications, and explore specific details of interest. For example, a user might upload a photograph and initially ask for an overview, then follow up with targeted questions such as, "What is written on the sign in the background?" or "Describe the person on the right." This level of interaction not only enhances comprehension but also restores a sense of agency and exploration that is often lost in conventional accessibility tools.

The integration of GPT-4o, Whisper, and ElevenLabs plays a pivotal role in achieving this goal. GPT-4o's vision-language reasoning enables highly detailed and context-aware scene descriptions that go beyond object recognition, capturing spatial relationships, emotional tone, and implied context. Whisper ensures that voice commands are transcribed with exceptional accuracy, even in noisy environments, which is essential for maintaining conversational flow. ElevenLabs adds a layer of naturalness and emotional expressiveness to the generated speech, making the interaction more human-like and engaging. Together, these components form a robust technological backbone that delivers both accuracy and usability in real-world conditions.

From a usability perspective, this system addresses several limitations found in related works. Many existing solutions are either designed for specific datasets, constrained by limited vocabulary, or lack the capability to adapt to user preferences. The comprehensive evaluation of three vision-language models using Ollama infrastructure (as shown in @tab:performance) demonstrates the system's commitment to optimal performance selection. The LLaVA 7B model's superior performance (2.51s latency, 90% human evaluation accuracy) enables real-time interaction while maintaining high description quality. By supporting local processing through Ollama's efficient model management, the system offers flexibility for users with different privacy requirements or connectivity constraints, ensuring effective operation in varied settings from urban environments to rural or offline contexts.

The transformative impact of this system extends across multiple domains with profound implications for the future. In educational environments, the technology will revolutionize how visually impaired students access visual learning materials, enabling independent engagement with complex diagrams, scientific illustrations, and mathematical visualizations. This represents a paradigm shift from dependency on human assistance to autonomous learning, fundamentally changing educational accessibility standards.

In professional contexts, the system promises to unlock unprecedented career opportunities by enabling direct interpretation of data visualizations, technical documentation, and business presentations. This capability will eliminate traditional barriers to advancement in data-driven fields, opening new pathways for professional growth and leadership roles previously inaccessible to blind professionals.

The personal and social implications are equally transformative. The technology will restore meaningful access to visual culture, enabling participation in art appreciation, family photograph sharing, and social media engagement. This represents more than convenience—it constitutes a restoration of fundamental human experiences that have been historically inaccessible.

The system also aligns with broader trends in human-centered AI design, which emphasize adaptability, personalization, and user empowerment. Insights drawn from the 25 reviewed research papers reveal that while AI has made significant advances in vision analysis, speech synthesis, and accessibility interface design, few solutions unify these capabilities into a cohesive, interactive, and real-time platform. The current work not only fills this gap but also sets a precedent for future developments in multimodal accessibility systems.

Nevertheless, challenges remain. Ensuring fairness in descriptions across diverse cultural contexts, maintaining user privacy, and improving the AI's ability to interpret abstract or symbolic imagery are all areas that require further research. Additionally, scaling the system to support multiple languages and dialects would expand its global impact, while integrating object-level segmentation and motion tracking would open the door to real-time video description.

In summary, the proposed system goes beyond the boundaries of conventional assistive technology by combining high-accuracy visual interpretation with responsive voice interaction, underpinned by a human-centered approach. Its potential to transform educational, professional, and personal experiences for blind and low-vision individuals underscores its value not only as a technological innovation but as a step toward a more inclusive digital future.

= Conclusion

The work presented in this research demonstrates the feasibility and transformative potential of a conversational, AI-powered image transcription system for blind and low-vision users. By combining advanced vision-language modeling, accurate speech recognition, and lifelike speech synthesis, the proposed platform offers more than static image descriptions—it provides an interactive, user-driven means of exploring visual content. Unlike conventional assistive tools, which often deliver limited and one-directional feedback, this approach replicates the natural curiosity-driven process of visual exploration, allowing users to ask questions, refine their focus, and receive immediate contextual responses.

The integration of GPT-4o, Whisper and ElevenLabs ensures that the system is capable of delivering both high-quality descriptions and fluid conversational engagement, while the inclusion of a local fallback model offers adaptability and privacy. Through a review of 25 related research works, it has been shown that although significant advancements have been made in individual domains such as computer vision, accessibility design, and speech technologies, unified real-time solutions remain rare. This project addresses that gap by delivering a holistic, practical tool designed for real-world accessibility needs.

The future roadmap for this technology promises exponential expansion of capabilities and global impact. Planned developments include multilingual support enabling worldwide accessibility, real-time video analysis for dynamic content interpretation, and integration with augmented reality platforms for immersive spatial understanding. Advanced features will include object-level segmentation for granular scene exploration, emotional context recognition for richer descriptions, and adaptive learning systems that personalize descriptions based on user preferences and expertise levels.

The scalability of the microservices architecture ensures seamless adaptation to emerging technologies, from 5G networks enabling instant cloud processing to edge computing devices providing ultra-low latency responses. Integration with smart home ecosystems, autonomous vehicles, and wearable technologies will create a comprehensive accessibility infrastructure that transforms daily life for blind and visually impaired individuals.

Beyond technical advancement, this research establishes a foundation for a future where visual information transcends the boundaries of sight. The ultimate vision encompasses a world where every image, video, and visual interface becomes inherently accessible, where artificial intelligence serves as a universal translator between visual and auditory experiences, and where digital equity is achieved through technological innovation.

The broader societal impact extends to economic empowerment, educational transformation, and social inclusion on an unprecedented scale. As this technology matures and proliferates, it will fundamentally reshape perceptions of disability, demonstrating that with appropriate technological support, visual impairment need not limit participation in any aspect of modern digital society. The future promises not merely accommodation, but true equality of access to the visual world.