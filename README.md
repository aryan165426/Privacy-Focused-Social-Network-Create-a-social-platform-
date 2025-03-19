Here's a README in markdown format for the smart contract of the **Decentralized Video Sharing Platform** based on the table of contents you mentioned:

---

# Decentralized Video Sharing Platform (DVSP) Smart Contract

## Table of Contents

- [Project Title](#project-title)
- [Project Description](#project-description)
- [Project Vision](#project-vision)
- [Future Scope](#future-scope)
- [Key Features](#key-features)

---

## Project Title

**Decentralized Video Sharing Platform (DVSP)**

---

## Project Description

The **Decentralized Video Sharing Platform (DVSP)** is a blockchain-based solution designed to allow users to upload, share, and monetize videos while retaining full control over their content and revenue. The platform uses smart contracts deployed on the **Aptos blockchain** to manage video metadata, tips, and platform fees securely.

With this solution, creators can upload videos, set metadata (such as title, description, and category), and accept tips from viewers. The smart contract ensures that only the uploader can modify the video metadata, and it includes protections against excessive tipping frequency. Additionally, a platform fee is applied to each tip, providing a sustainable revenue stream for platform maintenance.

---

## Project Vision

The vision for **DVSP** is to create a fully decentralized video-sharing ecosystem that empowers creators by providing a transparent and fair way to share their content and earn revenue. By eliminating intermediaries and central authorities, DVSP aims to:

- Give creators complete ownership over their content.
- Offer direct, blockchain-based monetization options such as tipping and subscriptions.
- Create a transparent revenue-sharing system that ensures creators are fairly compensated for their work.
- Build a decentralized video platform that is resistant to censorship and control by any central entity.

---

## Future Scope

In the future, **DVSP** aims to expand its functionality and improve user experience by adding the following features:

1. **Subscription Models**: Content creators can offer subscription-based access to premium content with smart contracts handling payments and access control.
2. **Advertisement Integration**: Enable creators to earn revenue from ads, with smart contracts distributing revenue fairly between the platform and the content creator.
3. **Advanced Analytics**: Offer content creators real-time analytics and insights into their video performance, tips, and subscriber base.
4. **Video Streaming and Hosting**: Extend the platform's capabilities to stream videos directly from decentralized storage (such as IPFS or Arweave), providing seamless viewing experiences.
5. **Community Governance**: Implement a decentralized governance system where token holders or creators can vote on changes or updates to the platform.

---

## Key Features

1. **Video Metadata Management**:
   - Allows video creators to upload metadata (e.g., title, description, category) and store it on the blockchain.
   - Metadata is immutable and only the uploader can update it.

2. **Tip System**:
   - Viewers can tip content creators directly in cryptocurrency (Aptos Coin).
   - Platform charges a small fee (5%) on each tip to support ongoing development and maintenance.
   - The contract ensures that tips are not spammed by limiting the frequency of tips per viewer.

3. **Platform Fee**:
   - A 5% platform fee is deducted from each tip and is retained by the platform (in the current implementation, this fee is not deposited anywhere, but it could be in future versions).

4. **Security and Access Control**:
   - Ensures that only the uploader can modify video metadata using access control checks.
   - Protects the platform from abuse by ensuring minimum time intervals between tips from the same viewer.

5. **Decentralized Storage Integration**:
   - The platform uses decentralized storage solutions like **IPFS** or **Arweave** to store the actual video files, ensuring content remains publicly accessible and censorship-resistant.

6. **Blockchain Transparency**:
   - All transactions (video uploads, tips, and metadata changes) are recorded on the Aptos blockchain, ensuring full transparency and security.

## Contract Address: 0x8fd97936250836892a3b5bc0145a44b390dfca61e154daa2a403bbee4dad8cd0

![Screenshot (3)](https://github.com/user-attachments/assets/89af9f0d-e93a-4429-b178-1fdae1d3eecd)
