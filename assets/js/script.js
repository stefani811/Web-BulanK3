// Team Carousel Auto-scroll
let currentTeamIndex = 0;
let carouselInterval;
const CAROUSEL_DELAY = 9000; // 9 detik delay untuk memberi waktu user klik tombol
let isPaused = false;

function getTotalTeams() {
    return document.querySelectorAll('.team-card').length;
}

function initCarousel() {
    // Re-query team cards in case DOM changed
    const cards = document.querySelectorAll('.team-card');
    if (cards.length === 0) {
        console.log('No team cards found');
        return;
    }
    
    // Update global variables
    currentTeamIndex = 0;
    
    // Set initial position
    updateCarouselPosition();
    
    // Start auto-scroll
    startCarousel();
}

function updateCarouselPosition() {
    const carousel = document.getElementById('teamCarousel');
    if (carousel) {
        carousel.style.transform = `translateX(-${currentTeamIndex * 100}%)`;
    }
}

function nextTeam() {
    const totalTeams = getTotalTeams();
    if (totalTeams === 0) return;
    
    currentTeamIndex = (currentTeamIndex + 1) % totalTeams;
    updateCarouselPosition();
    // Reset carousel timer when manually navigating
    if (carouselInterval) {
        clearInterval(carouselInterval);
        startCarousel();
    }
}

function previousTeam() {
    const totalTeams = getTotalTeams();
    if (totalTeams === 0) return;
    
    currentTeamIndex = (currentTeamIndex - 1 + totalTeams) % totalTeams;
    updateCarouselPosition();
    // Reset carousel timer when manually navigating
    if (carouselInterval) {
        clearInterval(carouselInterval);
        startCarousel();
    }
}

function startCarousel() {
    // Clear existing interval if any
    if (carouselInterval) {
        clearInterval(carouselInterval);
    }
    
    if (!isPaused) {
        // Start new interval
        carouselInterval = setInterval(nextTeam, CAROUSEL_DELAY);
    }
}

function stopCarousel() {
    isPaused = true;
    if (carouselInterval) {
        clearInterval(carouselInterval);
        carouselInterval = null;
    }
}

function resumeCarousel() {
    isPaused = false;
    if (!carouselInterval) {
        startCarousel();
    }
}

// Pause carousel when user interacts with team section
const teamSection = document.querySelector('.team-section');
if (teamSection) {
    // Pause on hover (desktop)
    teamSection.addEventListener('mouseenter', stopCarousel);
    teamSection.addEventListener('mouseleave', resumeCarousel);
    
    // Pause on touch (mobile)
    teamSection.addEventListener('touchstart', stopCarousel);
    teamSection.addEventListener('touchend', () => {
        // Resume after 3 seconds of no touch
        setTimeout(() => {
            if (isPaused) {
                resumeCarousel();
            }
        }, 3000);
    });
    
    // Pause when clicking on buttons
    const viewPlayerButtons = document.querySelectorAll('.btn-view-players');
    viewPlayerButtons.forEach(button => {
        button.addEventListener('click', () => {
            stopCarousel();
        });
    });
}

// View Players Function - Connected to database
function viewPlayers(teamCode) {
    // Stop carousel when modal opens
    stopCarousel();
    
    const modal = document.getElementById('playersModal');
    const playersList = document.getElementById('playersList');
    
    // Show loading
    playersList.innerHTML = '<p style="text-align: center; padding: 20px;">Memuat data pemain...</p>';
    modal.style.display = 'block';
    
    // Fetch players data from API
    fetch(`api/get_players.php?team_code=${encodeURIComponent(teamCode)}`)
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                playersList.innerHTML = `<p style="color: red;">${data.error}</p>`;
                return;
            }
            
            let html = '';
            if (data.team) {
                html += `<h3 style="margin-bottom: 20px; color: #1e3c72;">${data.team.team_name}</h3>`;
            }
            
            if (data.players && data.players.length > 0) {
                html += '<div style="overflow-x: auto;">';
                html += '<table style="width: 100%; border-collapse: collapse; margin-top: 10px;">';
                html += '<thead><tr style="background: #f0f0f0;"><th style="padding: 10px; text-align: left; border-bottom: 2px solid #ddd;">No</th><th style="padding: 10px; text-align: left; border-bottom: 2px solid #ddd;">Nama Pemain</th><th style="padding: 10px; text-align: left; border-bottom: 2px solid #ddd;">Posisi</th></tr></thead>';
                html += '<tbody>';
                
                data.players.forEach((player, index) => {
                    html += '<tr style="border-bottom: 1px solid #eee;">';
                    html += `<td style="padding: 10px;">${player.player_number || '-'}</td>`;
                    html += `<td style="padding: 10px;">${player.player_name}</td>`;
                    html += `<td style="padding: 10px;">${player.position || '-'}</td>`;
                    html += '</tr>';
                });
                
                html += '</tbody></table></div>';
            } else {
                html += '<p style="text-align: center; padding: 20px; color: #666;">Belum ada data pemain untuk tim ini.</p>';
            }
            
            playersList.innerHTML = html;
        })
        .catch(error => {
            console.error('Error:', error);
            playersList.innerHTML = '<p style="color: red;">Terjadi kesalahan saat memuat data pemain.</p>';
        });
    
    // Resume carousel when modal closes
    const closeBtn = document.querySelector('.close');
    if (closeBtn) {
        closeBtn.onclick = function() {
            modal.style.display = 'none';
            resumeCarousel();
        };
    }
    
    // Close modal when clicking outside
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
            resumeCarousel();
        }
    };
}

// Initialize when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    // Re-initialize carousel after DOM is ready
    setTimeout(function() {
        initCarousel();
    }, 100);
    
    // Prevent page scroll when scrolling in scoreboard
    const scoreboardWrapper = document.querySelector('.scoreboard-wrapper');
    if (scoreboardWrapper) {
        scoreboardWrapper.addEventListener('wheel', function(e) {
            const isScrollingDown = e.deltaY > 0;
            const isScrollingUp = e.deltaY < 0;
            const isAtTop = this.scrollTop === 0;
            const isAtBottom = this.scrollTop + this.clientHeight >= this.scrollHeight - 1;
            
            // Prevent page scroll when scrolling in scoreboard
            if ((isScrollingDown && !isAtBottom) || (isScrollingUp && !isAtTop)) {
                e.stopPropagation();
            }
        });
    }
});

