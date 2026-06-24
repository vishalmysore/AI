# Technical Analysis: Recursive Multi-Agent Systems (RecursiveMAS)

This document provides a factual deep-dive into the [recursiveMASWebLLM](https://github.com/vishalmysore/recursiveMASWebLLM) and [recursiveMASDemo](https://github.com/vishalmysore/recursiveMASDemo) projects, assessing their purpose and innovativeness.

## 1. Executive Summary
The projects implement the research paper *"Recursive Multi-Agent Systems"* (Yang, Zou, et al., 2024), providing a browser-native pipeline for high-performance agent collaboration. By moving agent communication from natural language (text) to the model's internal **latent space** (vectors), the system achieves significant gains in speed and token efficiency while running entirely on local hardware via WebGPU.

## 2. Core Components

### A. Infrastructure: `recursiveMASWebLLM`
This repository serves as a model-building factory. Its primary innovation is hacking the standard LLM execution stack to enable "transparent" models.
- **Graph Surgery:** It uses **MLC-LLM** and **TVM Relax** to patch the model's computation graph. It exposes `get_last_hidden`, allowing external access to the model's "internal thoughts" (hidden states) before they are converted into words.
- **RecursiveLink:** It provides a training pipeline for lightweight residual modules ($R_{out}$) that act as translators between different models. This allows heterogeneous models (e.g., a Qwen Planner and a Llama Solver) to communicate directly in vector space.

### B. Runtime: `recursiveMASDemo`
This Vite-based application is an interactive playground for orchestrating recursive agent loops.
- **Latent Orchestration:** The `latent-chain.js` module implements the "Recursive Loop" where agents pass vectors instead of chat transcripts.
- **Collaboration Patterns:** It demonstrates four distinct patterns:
    - **Sequential:** Linear chain of reasoning (Planner → Critic → Solver).
    - **Mixture:** Parallel domain specialists aggregated by a summarizer.
    - **Distillation:** Knowledge transfer from a large Expert to a small Learner.
    - **Deliberation:** Iterative debate between a Reflector and a Tool-Caller.

## 3. Key Innovations

### I. Browser-Native Latent Transfer
Traditional Multi-Agent Systems suffer from the "Text Bottleneck"—the need to decode/encode reasoning at every step. This project is a pioneer in bringing **cross-model latent transfer** to the browser. It democratizes advanced agentic research by allowing it to run on any WebGPU-capable consumer device.

### II. Systems-Level Efficiency
The implementation reproduces the paper's efficiency claims on real local models:
- **Token Reduction:** 34.6–75.6% fewer tokens are processed because intermediate reasoning is never converted to text.
- **Speed-up:** Wall-clock time is reduced by 1.2–2.4× compared to traditional text-passing systems.
- **Local-First Privacy:** By using WebLLM/WebGPU, the entire system operates with zero API costs and absolute data privacy.

### III. Technical Novelty: "The Grey Box"
Most browser-native AI treats the model as a "black box" (Input Text → Output Text). This project treats the model as a "grey box," re-compiling the underlying Wasm/WebGPU graph to expose and manipulate internal tensors. This represents a significant leap in the complexity of browser-based AI orchestration.

## 4. Comparison Table

| Feature | Text-MAS (Standard) | RecursiveMAS (This Implementation) |
| :--- | :--- | :--- |
| **Communication Medium** | Natural Language Prose | High-dimensional Vectors |
| **Information Loss** | High (compression to text) | Minimal (Latent-to-Latent) |
| **Computation Source** | Often Cloud-based APIs | Local WebGPU (On-Device) |
| **Token Cost** | $O(\text{Rounds} \times \text{Agents})$ | $O(1)$ for intermediate steps |
| **User Experience** | Latent-heavy / Slow | Fast / Low-latency |

## Conclusion
The **RecursiveMAS** implementation by Vishal Mysore is a highly innovative technical feat. It successfully bridges the gap between low-level model compilation and high-level agentic reasoning, providing one of the first practical implementations of latent-space agent collaboration for the web.
