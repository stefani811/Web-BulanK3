let currentTeamIndex = 0;
let carouselInterval;
const CAROUSEL_DELAY = 9000;
let isPaused = false;

function getTotalTeams() {
    return document.querySelectorAll('.team-card').length;
}

function initCarousel() {
    const cards = document.querySelectorAll('.team-card');
    if (cards.length === 0) {
        console.log('No team cards found');
        return;
    }
    
    currentTeamIndex = 0;
    
    updateCarouselPosition();
    
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
    if (carouselInterval) {
        clearInterval(carouselInterval);
        startCarousel();
    }
}

function startCarousel() {
    if (carouselInterval) {
        clearInterval(carouselInterval);
    }
    
    if (!isPaused) {
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

const teamSection = document.querySelector('.team-section');
if (teamSection) {
    teamSection.addEventListener('mouseenter', stopCarousel);
    teamSection.addEventListener('mouseleave', resumeCarousel);
    
    teamSection.addEventListener('touchstart', stopCarousel);
    teamSection.addEventListener('touchend', () => {
        setTimeout(() => {
            if (isPaused) {
                resumeCarousel();
            }
        }, 3000);
    });
    
    const viewPlayerButtons = document.querySelectorAll('.btn-view-players');
    viewPlayerButtons.forEach(button => {
        button.addEventListener('click', () => {
            stopCarousel();
        });
    });
}

function viewPlayers(teamCode) {
    stopCarousel();
    
    const modal = document.getElementById('playersModal');
    const playersList = document.getElementById('playersList');
    
    playersList.innerHTML = '<p style="text-align: center; padding: 20px;">Memuat data pemain...</p>';
    modal.style.display = 'block';
    // First try server-side preloaded HTML fragment (avoids XHR issues on some hosts)
    const preloaded = document.getElementById('players_data_' + teamCode);
    if (preloaded) {
        playersList.innerHTML = preloaded.innerHTML;
    } else {
        // Fallback to AJAX JSON API if fragment not present
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
                    html += '<ol style="padding-left:20px; margin-top:10px; color:#222;">';
                    data.players.forEach((player) => {
                        html += `<li style="margin-bottom:6px;">${player.player_name}</li>`;
                    });
                    html += '</ol>';
                } else {
                    html += '<p style="text-align: center; padding: 20px; color: #666;">Belum ada data pemain untuk tim ini.</p>';
                }
                
                playersList.innerHTML = html;
            })
            .catch(error => {
                console.error('Error:', error);
                playersList.innerHTML = '<p style="color: red;">Terjadi kesalahan saat memuat data pemain.</p>';
            });
    }
    
    const closeBtn = document.querySelector('.close');
    if (closeBtn) {
        closeBtn.onclick = function() {
            modal.style.display = 'none';
            resumeCarousel();
        };
    }
    
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
            resumeCarousel();
        }
    };
}

// Leaderboard Sorting
let leaderboardSortDirection = {
    rank: 'desc',
    team: 'asc',
    score: 'desc'
};

function sortLeaderboard(column) {
    const tbody = document.getElementById('leaderboardBody');
    if (!tbody) return;
    
    const rows = Array.from(tbody.querySelectorAll('tr'));
    const currentDirection = leaderboardSortDirection[column];
    const newDirection = currentDirection === 'asc' ? 'desc' : 'asc';
    leaderboardSortDirection[column] = newDirection;
    
    rows.sort((a, b) => {
        let aValue, bValue;
        
        if (column === 'rank') {
            aValue = parseInt(a.cells[0].textContent.trim());
            bValue = parseInt(b.cells[0].textContent.trim());
        } else if (column === 'team') {
            aValue = a.cells[1].textContent.trim().toLowerCase();
            bValue = b.cells[1].textContent.trim().toLowerCase();
        } else if (column === 'score') {
            aValue = parseInt(a.cells[2].textContent.trim()) || 0;
            bValue = parseInt(b.cells[2].textContent.trim()) || 0;
        }
        
        if (newDirection === 'asc') {
            return aValue > bValue ? 1 : aValue < bValue ? -1 : 0;
        } else {
            return aValue < bValue ? 1 : aValue > bValue ? -1 : 0;
        }
    });
    
    // Update rank after sorting
    rows.forEach((row, index) => {
        row.cells[0].textContent = index + 1;
        tbody.appendChild(row);
    });
    
    // Update sort icons
    document.querySelectorAll('.sort-icon').forEach(icon => {
        icon.textContent = 'expand_all';
    });
    
    const activeHeader = document.querySelector(`th[data-sort="${column}"]`);
    if (activeHeader) {
        const icon = activeHeader.querySelector('.sort-icon');
        if (icon) {
            icon.textContent = newDirection === 'asc' ? 'expand_less' : 'expand_more';
        }
    }
}

document.addEventListener('DOMContentLoaded', function() {
    setTimeout(function() {
        initCarousel();
    }, 100);
    
    const scoreboardWrapper = document.querySelector('.scoreboard-wrapper');
    if (scoreboardWrapper) {
        scoreboardWrapper.addEventListener('wheel', function(e) {
            const isScrollingDown = e.deltaY > 0;
            const isScrollingUp = e.deltaY < 0;
            const isAtTop = this.scrollTop === 0;
            const isAtBottom = this.scrollTop + this.clientHeight >= this.scrollHeight - 1;
            
            if ((isScrollingDown && !isAtBottom) || (isScrollingUp && !isAtTop)) {
                e.stopPropagation();
            }
        });
    }
    
    // Leaderboard sorting
    document.querySelectorAll('.leaderboard-table th.sortable').forEach(header => {
        header.addEventListener('click', function() {
            const column = this.getAttribute('data-sort');
            if (column) {
                sortLeaderboard(column);
            }
        });
    });
});

// Week buttons: load schedule via AJAX and preserve scroll position
document.addEventListener('DOMContentLoaded', function() {
    function updateWeekButtons(activeWeek) {
        document.querySelectorAll('.week-btn').forEach(btn => {
            const href = btn.getAttribute('href') || '';
            const params = new URL(href, window.location.origin).searchParams;
            const w = params.get('week') || '1';
            if (String(w) === String(activeWeek)) {
                btn.style.background = '#1e3c72';
                btn.style.color = '#fff';
            } else {
                btn.style.background = '#f0f0f0';
                btn.style.color = '#333';
            }
        });
    }

    document.querySelectorAll('.week-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const href = this.getAttribute('href');
            if (!href) return;

            // preserve current scroll
            const scrollY = window.scrollY || window.pageYOffset;

            const fetchUrl = new URL(href, window.location.origin);

            fetch(fetchUrl.toString(), { headers: { 'X-Requested-With': 'XMLHttpRequest' } })
                .then(resp => resp.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');

                    const newSchedule = doc.querySelector('.schedule-container');
                    const currentSchedule = document.querySelector('.schedule-container');
                    if (newSchedule && currentSchedule) {
                        currentSchedule.innerHTML = newSchedule.innerHTML;
                    }

                    // update URL without reload
                    history.pushState({}, '', fetchUrl.toString());

                    // update week buttons styling
                    const activeWeek = fetchUrl.searchParams.get('week') || '1';
                    updateWeekButtons(activeWeek);

                    // restore scroll position
                    window.scrollTo(0, scrollY);
                })
                .catch(err => {
                    console.error('Failed to load week:', err);
                    // fallback to navigate if AJAX fails
                    window.location.href = href;
                });
        });
    });
});

