#!/usr/bin/ruby
$team1              = ARGV[0].to_f
$team2              = ARGV[1].to_f
$team1_set_score    = 0
$team2_set_score    = 0
$team1_score        = 0
$team2_score        = 0
$set                = ""

def score(luck, team)
    probability = rand(0..10)
    probability = probability.to_f / 10.0

    if (probability <= luck)
        if (team == 1)
            $team1_set_score += 1
            puts $set + " " + $team1_set_score.to_s + "-" + $team2_set_score.to_s
            return 1
        else
            $team2_set_score += 1
            puts $set + " " + $team1_set_score.to_s + "-" + $team2_set_score.to_s
            return 2
        end
    else
        if (team == 1)
            $team2_set_score += 1
            puts $set + " " + $team1_set_score.to_s + "-" + $team2_set_score.to_s
            return 2
        else
            $team1_set_score += 1
            puts $set + " " + $team1_set_score.to_s + "-" + $team2_set_score.to_s
            return 1
        end
    end
end

def service(team, max_point)
    engage = team

    while $team1_set_score < ($team2_set_score + 2) && $team2_set_score < ($team1_set_score + 2)
        while $team1_set_score < max_point && $team2_set_score < max_point
            if (engage == 1)
                engage = score($team1, 1)
            else
                engage = score($team2, 2)
            end
        end
        
        if ($team1_set_score == max_point || $team2_set_score == max_point)
            if ($team1_set_score > $team2_set_score && $team1_set_score < ($team2_set_score + 2))
                max_point = $team2_set_score + 2
            elsif ($team2_set_score > $team1_set_score && $team2_set_score < ($team1_set_score + 2))
                max_point = $team1_set_score + 2
            elsif ($team1_set_score == $team2_set_score)
                max_point += 2
            end
        end
    end

    $set = $set + " " + $team1_set_score.to_s + "-" + $team2_set_score.to_s
    if ($team1_set_score > $team2_set_score)
        $team1_score += 1
    else
        $team2_score += 1
    end
    $team1_set_score = 0
    $team2_set_score = 0
end

puts $team1_set_score.to_s + "-" + $team2_set_score.to_s

service(1, 25)
service(2, 25)
service(1, 25)
if ($team1_score < 3 && $team2_score < 3)
    service(2, 15)
end