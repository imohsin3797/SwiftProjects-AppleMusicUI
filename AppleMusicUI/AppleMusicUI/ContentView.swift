//
//  ContentView.swift
//  AppleMusicUI
//
//  Created by Ibrahim Mohsin on 9/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var playbackPosition: Double = 0 // Slider value
    @State private var volume: Double = 0.5 // Initial volume value (0.5 represents 50%)

    
    let trackDuration: Double = 210 // Track duration in seconds (e.g., 3.5 minutes)
    
    var body: some View {
        ZStack{
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.gray, Color.black]), // Custom gradient colors
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea() // Make sure the gradient covers the entire screen
            
            VStack(){
                Image(systemName: "chevron.down")
                    .font(.title)
                    .padding(.top, 15)
                    .foregroundColor(Color.gray)
                Spacer()
                
                
                Image("Metro Boomin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 325, height: 325) // Set a fixed size for the artwork
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 12)
                
                Spacer()
                
                HStack{
                    VStack{
                        HStack {
                            Text("Trance")
                                .font(.custom("SFProDisplay - Bold", size: 20)) // Use bold custom font
                                .padding(.leading, 25) // Add padding to the left
                                .foregroundColor(Color.white)
                            
                            Image(systemName: "e.square.fill") // The image next to the text
                                .font(.title2) // Optional: Set the font size for the image
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // Align HStack contents to the leading (left)
                        
                        Text("Metro Boomin")
                            .fontWeight(.bold) // Set text to bold
                            .font(.custom("SFProDisplay-Regular", size: 20)) // Use custom font
                            .padding(.leading, 25) // Add padding to the left
                            .frame(maxWidth: .infinity, alignment: .leading) // Align HStack contents to the leading (left)
                            .foregroundColor(Color.white)
                        
                    }
                    Spacer()
                    Image(systemName: "star.circle")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Image(systemName: "ellipsis.circle")
                        .font(.title)
                        .padding()
                        .foregroundColor(Color.white)
                }
                
                VStack {
                    // Slider and time display
                    HStack {
                        Text("\(formatTime(playbackPosition))") // Display current time
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Slider(value: $playbackPosition, in: 0...trackDuration) {
                            Text("Playback")
                        }
                        .accentColor(.white) // Customize slider color
                        
                        Text("\(formatTime(trackDuration))") // Display track duration
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    // Playback controls
                    HStack {
                        Image(systemName: "backward.fill")
                            .font(.title2)
                            .padding()
                            .foregroundColor(.white)
                        
                        Button(action: {
                            isPlaying.toggle() // Toggle play/pause state
                        }) {
                            Image(systemName: isPlaying ? "pause" : "play.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }
                        .padding()
                        
                        Image(systemName: "forward.fill")
                            .font(.title2)
                            .padding()
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 25)
                HStack {
                    Image(systemName: "speaker.fill") // Low volume icon
                        .foregroundColor(.white)
                    
                    Slider(value: $volume, in: 0...1) {
                        Text("Volume") // Optional label for accessibility
                    }
                    .accentColor(.gray) // Customize the slider's color
                    
                    Image(systemName: "speaker.wave.3.fill") // High volume icon
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 20) // Adjust padding around the slider
                

                
            }
            
        }
    }
    }

func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

#Preview {
    ContentView()
}
