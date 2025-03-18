module VideoSharing::Platform {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::timestamp;

    const FEE_PERCENTAGE: u64 = 5; // Platform fee as 5% of each tip
    const MIN_TIP_INTERVAL: u64 = 60; // Minimum time (in seconds) between tips by the same viewer

    /// Struct representing video metadata
    struct Video has store, key {
        uploader: address,         // Address of the video uploader
        title: vector<u8>,         // Title of the video
        url: vector<u8>,           // URL where the video is hosted
        description: vector<u8>,   // Video description
        category: vector<u8>,      // Video category (e.g., 'Music', 'Education', etc.)
        tags: vector<vector<u8>>,  // List of tags for the video
        total_tips: u64,           // Total tips received for the video
        last_tip_timestamp: u64,   // Timestamp of the last tip from any viewer
    }

    /// Function to upload a new video with metadata.
    public fun upload_video(owner: &signer, title: vector<u8>, url: vector<u8>, description: vector<u8>, category: vector<u8>, tags: vector<vector<u8>>) {
        let video = Video {
            uploader: signer::address_of(owner),
            title,
            url,
            description,
            category,
            tags,
            total_tips: 0,
            last_tip_timestamp: 0,
        };
        move_to(owner, video);
    }

    /// Function for users to tip a video uploader, with a platform fee.
    public fun tip_video(viewer: &signer, video_owner: address, amount: u64) acquires Video {
        let current_time = timestamp::now_seconds();
        let video = borrow_global_mut<Video>(video_owner);
        
        // Ensure minimum time between tips to prevent spam
        assert!(current_time - video.last_tip_timestamp >= MIN_TIP_INTERVAL, 1); // Error code 1: Too frequent tipping

        // Calculate the platform fee and tip amount after the fee
        let fee = (amount * FEE_PERCENTAGE) / 100;
        let net_tip = amount - fee;

        // Transfer the tip to the video owner and the fee to the platform
        let tip = coin::withdraw<AptosCoin>(viewer, amount);
        coin::deposit<AptosCoin>(video_owner, net_tip);
        // In a real platform, you would deposit the fee somewhere (platform wallet). Here, we simply ignore the fee.

        // Update the total tips and timestamp
        video.total_tips = video.total_tips + net_tip;
        video.last_tip_timestamp = current_time;
    }

    /// Function to allow the video uploader to update video metadata.
    public fun update_video_metadata(owner: &signer, new_title: vector<u8>, new_description: vector<u8>, new_category: vector<u8>, new_tags: vector<vector<u8>>) acquires Video {
        let video = borrow_global_mut<Video>(signer::address_of(owner));

        // Ensure only the uploader can update metadata
        assert!(video.uploader == signer::address_of(owner), 2); // Error code 2: Unauthorized

        // Update the metadata
        video.title = new_title;
        video.description = new_description;
        video.category = new_category;
        video.tags = new_tags;
    }
}
