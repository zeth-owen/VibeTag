//
//  Vibe.swift
//  VibeTag
//
//  Created by Zeth Thomas on 2/4/25.
//

import Foundation

enum Vibes: String, CaseIterable {
    case nightclubs = "Nightclubs"
    case loungeBars = "Lounge Bars"
    case sportsBars = "Sports Bars"
    case luxuryBars = "Luxury Bars"
    case diveBars = "Dive Bars"
    case poolBars = "Pool Bars"
    case rooftopBars = "Rooftop Bars"
    case lgbtqBars = "LGBTQ+ Bars"
}


struct Bar: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    var category: Vibes
}


struct VibesData {
    
    static let vibes: [Vibes: [Bar]] = [
        
        .nightclubs: [
            Bar(name: "XS Nightclub", description: "A high-energy nightclub with top DJs and extravagant light shows.", imageName: "XSNightClub", category: .nightclubs),
            Bar(name: "Omnia Nightclub", description: "A massive nightclub featuring cutting-edge technology and world-class DJs.", imageName: "Omnia", category: .nightclubs),
            Bar(name: "Hakkasan Nightclub", description: "An upscale club with a top-tier sound system and celebrity DJs.", imageName: "Hakkasan", category: .nightclubs),
            Bar(name: "Marquee Nightclub", description: "A buzzing club with multiple rooms and rooftop views.", imageName: "Marquee", category: .nightclubs),
            Bar(name: "Drai's Nightclub", description: "A rooftop nightclub with stunning views and a glamorous crowd.", imageName: "Drai's", category: .nightclubs)
        ],
        
        .loungeBars: [
            Bar(name: "The Chandelier", description: "A multi-level bar inside The Cosmopolitan with unique cocktails and stunning design.", imageName: "Chandelier", category: .loungeBars),
            Bar(name: "Skyfall Lounge", description: "An upscale lounge with panoramic views of the Strip and handcrafted cocktails.", imageName: "Skyfall", category: .loungeBars),
            Bar(name: "Vesper Bar", description: "A stylish, modern bar offering classic cocktails in an intimate setting.", imageName: "Vesper", category: .loungeBars),
            Bar(name: "Lavo Nightclub and Lounge", description: "A trendy spot combining a nightclub vibe with lounge-style comfort.", imageName: "Lavo", category: .loungeBars),
            Bar(name: "Eiffel Tower Restaurant & Lounge", description: "Enjoy breathtaking views of the Strip from the top of the Eiffel Tower.", imageName: "Eiffel Tower", category: .loungeBars)
        ],
        
        .sportsBars: [
            Bar(name: "Lagasse's Stadium", description: "An exciting sports bar with large screens and excellent food.", imageName: "Lagasse", category: .sportsBars),
            Bar(name: "The Book", description: "A modern sports bar with a luxury feel and plenty of TVs.", imageName: "Book", category: .sportsBars),
            Bar(name: "Blondies Sports Bar", description: "Casual bar with great beer selection and multiple big-screen TVs.", imageName: "Blondies", category: .sportsBars),
            Bar(name: "The D Bar", description: "A lively sports bar with a retro vibe and tons of seating.", imageName: "Dbar", category: .sportsBars),
            Bar(name: "PBR Rock Bar", description: "An energetic venue where you can watch live sports and enjoy the rock bar experience.", imageName: "pbrRockBar", category: .sportsBars)
        ],
        
        .luxuryBars: [
            Bar(name: "Mayfair Supper Club", description: "A glamorous supper club with top-notch cocktails and fine dining.", imageName: "mayfair", category: .luxuryBars),
            Bar(name: "The Vault", description: "An exclusive bar featuring rare spirits and a luxurious ambiance.", imageName: "The Vault", category: .luxuryBars),
            Bar(name: "The Lexi", description: "A sophisticated bar offering inventive cocktails in a stylish environment.", imageName: "Lexi", category: .luxuryBars),
            Bar(name: "Rooftop Bar at the Cromwell", description: "Chic rooftop bar offering signature drinks and views of the Strip.", imageName: "Cromwell", category: .luxuryBars),
            Bar(name: "The Vesper", description: "A sleek and modern space perfect for enjoying crafted cocktails.", imageName: "Vesper", category: .luxuryBars)
        ],
        
        .diveBars: [
            Bar(name: "Atomic Liquors", description: "A classic dive bar with an old-school charm and history.", imageName: "AtomicImage", category: .diveBars),
            Bar(name: "Double Down Saloon", description: "A quirky dive bar with an eccentric atmosphere and strong drinks.", imageName: "DoubleDownImage", category: .diveBars),
            Bar(name: "The Golden Tiki", description: "A kitschy tiki bar with fun cocktails and a tropical vibe.", imageName: "GoldenTikiImage", category: .diveBars),
            Bar(name: "Frankie's Tiki Room", description: "A dark, intimate tiki bar serving classic and unique cocktails.", imageName: "FrankiesTikiImage", category: .diveBars),
            Bar(name: "Hogs & Heifers Saloon", description: "A wild dive bar with a biker vibe and plenty of beer on tap.", imageName: "HogsHeifersImage", category: .diveBars)
        ],
        
        .poolBars: [
            Bar(name: "Marquee Dayclub", description: "An energetic poolside bar with daytime parties and exclusive DJs.", imageName: "MarqueePoolImage", category: .poolBars),
            Bar(name: "Liquid Pool Lounge", description: "An upscale pool bar offering a mix of great drinks and an even better vibe.", imageName: "LiquidPoolImage", category: .poolBars),
            Bar(name: "Rehab Beach Club", description: "Hard Rock's iconic pool party experience with DJs and poolside fun.", imageName: "RehabBeachImage", category: .poolBars),
            Bar(name: "Azure Pool at The Palazzo", description: "A luxurious pool bar with a more relaxed atmosphere and poolside service.", imageName: "AzurePoolImage", category: .poolBars),
            Bar(name: "The Pool at The Venetian", description: "Enjoy a refreshing cocktail by the gorgeous pools at The Venetian.", imageName: "VenetianPoolImage", category: .poolBars)
        ],
        
        .rooftopBars: [
            Bar(name: "Skyfall Lounge", description: "An elevated bar with stunning views of the city and an elegant vibe.", imageName: "SkyfallRooftopImage", category: .rooftopBars),
            Bar(name: "Foundation Room", description: "An upscale rooftop bar at Mandalay Bay offering breathtaking views.", imageName: "FoundationRoomImage", category: .rooftopBars),
            Bar(name: "The Stratosphere (Top of the World)", description: "A high-altitude bar with jaw-dropping views of the city below.", imageName: "StratosphereImage", category: .rooftopBars),
            Bar(name: "High Roller Bar", description: "A unique bar located in the High Roller observation wheel, offering spectacular views.", imageName: "HighRollerImage", category: .rooftopBars),
            Bar(name: "SkyBar at ARIA", description: "A sleek and stylish rooftop bar with a perfect view of the Strip.", imageName: "SkyBarImage", category: .rooftopBars)
        ],
        
        .lgbtqBars: [  // New LGBTQ+ bars category
            Bar(name: "Piranha Nightclub", description: "A popular LGBTQ+ nightclub with drag shows, dancing, and vibrant cocktails.", imageName: "Piranha", category: .lgbtqBars),
            Bar(name: "Gipsy", description: "A trendy LGBTQ+ bar known for its eclectic mix of music and fun atmosphere.", imageName: "Gipsy", category: .lgbtqBars),
            Bar(name: "Phoenix Bar", description: "A classic LGBTQ+ bar with a laid-back vibe, great for both locals and tourists.", imageName: "Phoenix", category: .lgbtqBars),
            Bar(name: "The Garage", description: "A cozy LGBTQ+ dive bar with karaoke nights and a welcoming crowd.", imageName: "Garage", category: .lgbtqBars),
            Bar(name: "The Crib", description: "A fun and intimate LGBTQ+ bar known for its themed nights and inclusive energy.", imageName: "Crib", category: .lgbtqBars)
        ]
    ]
}


