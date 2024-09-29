###########Circular Histogram###############

library(ggplot2)

df = data.frame(xvar = 0:23, 
                y = c(468,520,459,256,397,241,117,120,45,100,231,398,340,276,151,134,157,203,308,493,537,462,448,383))


ggplot(df, aes(xvar, y)) +
        coord_polar(theta = "x", start = 0, direction = 1) +
        geom_bar(stat = "identity", fill = "black", width = .9) +
        geom_hline(yintercept = seq(0, 500, by = 100), color = "red", size = 0.4) +
        scale_x_continuous(breaks = seq(0, 24), labels = seq(0, 24)) +
        xlab("X Axis Title") +
        ylab("Y Axis Title") +
        ggtitle("Figure Title") +
        theme_bw()





########### Circular Histogram with Enhanced Features ###############

library(ggplot2)

# Data frame
df = data.frame(xvar = 0:23, 
                y = c(468,520,459,256,397,241,117,120,45,100,231,398,340,276,151,134,157,203,308,493,537,462,448,383))

# Circular Histogram
ggplot(df, aes(xvar, y, fill = y)) +  # Add fill based on y values
        coord_polar(theta = "x", start = 0, direction = 1) +
        geom_bar(stat = "identity", width = .9, color = "white") +  # Add bar borders
        geom_hline(yintercept = seq(0, 500, by = 100), color = "red", size = 0.4) +
        
        # Add labels to bars
        geom_text(aes(label = y), position = position_stack(vjust = 1.1), size = 3, color = "black") +
        
        # Customizing fill colors (gradient)
        scale_fill_gradient(low = "lightblue", high = "darkblue") +
        
        # Customizing X and Y axis labels
        scale_x_continuous(breaks = seq(0, 23), labels = seq(0, 23)) +
        xlab("Time (Hours)") +  # Customized X-axis label
        ylab("Frequency") +  # Customized Y-axis label
        
        # Custom Title and Subtitle
        ggtitle("Circular Histogram", subtitle = "Frequency distribution over 24 hours") +
        
        # Theme Customization
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10),  # Adjust X-axis text
              axis.text.y = element_text(size = 10),  # Adjust Y-axis text
              plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Center and bold title
              plot.subtitle = element_text(hjust = 0.5, size = 12),  # Center subtitle
              panel.grid = element_blank())  # Remove default gridlines
